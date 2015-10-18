package com.ezcloud.framework.weixin.service;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.codehaus.jettison.json.JSONException;

import com.ezcloud.framework.weixin.model.ListBean;
import com.ezcloud.framework.weixin.model.Student;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.json.JettisonMappedXmlDriver;
import com.thoughtworks.xstream.io.json.JsonHierarchicalStreamDriver;
import com.thoughtworks.xstream.io.json.JsonWriter;
 
/**
 * <b>function:</b>Java对象和XML字符串的相互转换
 * jar-lib-version: xstream-1.3.1
 * @author hoojo
 * @createDate Nov 27, 2010 12:15:15 PM
 * @file XStreamTest.java
 * @package com.hoo.test
 * @project WebHttpUtils
 * @blog http://blog.csdn.net/IBM_hoojo
 * @email hoojo_@126.com
 * @version 1.0
 */
@SuppressWarnings("unchecked")
public class Test {
    
    private XStream xstream = null;
    private ObjectOutputStream  out = null;
    private ObjectInputStream in = null;
    
    private Student bean = null;
    
    /**
     * <b>function:</b>初始化资源准备
     * @author hoojo
     * @createDate Nov 27, 2010 12:16:28 PM
     */
    public void init() {
        try {
            xstream = new XStream();
            //xstream = new XStream(new DomDriver()); // 需要xpp3 jar
        } catch (Exception e) {
            e.printStackTrace();
        }
        bean = new Student();
        bean.setAddress("china");
        bean.setAge("25");
        bean.setId("1");
        bean.setName("jack");
    }
    
    /**
     * <b>function:</b>释放对象资源
     * @author hoojo
     * @createDate Nov 27, 2010 12:16:38 PM
     */
    public void destory() {
        xstream = null;
        bean = null;
        try {
            if (out != null) {
                out.flush();
                out.close();
            }
            if (in != null) {
                in.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.gc();
    }
    
    public final void fail(String string) {
        System.out.println(string);
    }
    
    public final void failRed(String string) {
        System.err.println(string);
    }
    
    public void writeBean2XML() {
        try {
            fail("------------Bean->XML------------");
            fail(xstream.toXML(bean));
            fail("重命名后的XML");
            //类重命名
            //xstream.alias("account", Student.class);
            //xstream.alias("生日", Birthday.class);
            //xstream.aliasField("生日", Student.class, "birthday");
            //xstream.aliasField("生日", Birthday.class, "birthday");
            //fail(xstream.toXML(bean));
            //属性重命名
//            xstream.aliasField("年龄", Student.class, "age");
            //包重命名
            xstream.aliasPackage("weixin", "com.ezcloud.weixin.model");
            fail(xstream.toXML(bean));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void writeList2XML() {
        try {
            //修改元素名称
            xstream.alias("beans", ListBean.class);
            xstream.alias("student", Student.class);
            fail("----------List-->XML----------");
            ListBean listBean = new ListBean();
            listBean.setName("this is a List Collection");
            List<Object> list = new ArrayList<Object>();
            list.add(bean);
            list.add(bean);//引用bean
            //list.add(listBean);//引用listBean，父元素
            
            bean = new Student();
            bean.setAddress("china");
            bean.setId("7");
            bean.setName("tom");
            list.add(bean);
            
            bean = new Student();
            bean.setAddress("shenzhen");
            bean.setId("8");
            bean.setName("john");
            list.add(bean);
            listBean.setList(list);
            
            //将ListBean中的集合设置空元素，即不显示集合元素标签
//            xstream.addImplicitCollection(ListBean.class, "list");
            
            //设置reference模型
            xstream.setMode(XStream.NO_REFERENCES);//不引用
//            xstream.setMode(XStream.ID_REFERENCES);//id引用
            //xstream.setMode(XStream.XPATH_ABSOLUTE_REFERENCES);//绝对路径引用
              
            //将name设置为父类（Student）的元素的属性
            xstream.useAttributeFor(Student.class, "name");
//            xstream.useAttributeFor(Birthday.class, "birthday");
            //修改属性的name
//            xstream.aliasAttribute("姓名", "name");
//            xstream.aliasField("生日", Birthday.class, "birthday");
          
            fail(xstream.toXML(listBean));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    public void writeMap2XML() {
        try {
            failRed("---------Map --> XML---------");
            Map<String, Student> map = new HashMap<String, Student>();
            map.put("No.1", bean);//put
            
            bean = new Student();
            bean.setAddress("china");
            bean.setId("2");
            bean.setName("tom");
            
            map.put("No.2", bean);//put
            
            bean = new Student();
            bean.setId("11");
            bean.setName("jack");
            bean.setAddress("china");
            map.put("No.3", bean);//put
            
            xstream.alias("student", Student.class);
            xstream.alias("key", String.class);
//            xstream.useAttributeFor(Student.class, "id");
//            xstream.useAttributeFor(Student.class, "name");
            fail(xstream.toXML(map));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public void writeXML4OutStream() {
        try {
            out = xstream.createObjectOutputStream(System.out);
            Student stu = new Student();
            stu.setName("jack");
            stu.setAddress("==========sdjkfs==");
            failRed("---------ObjectOutputStream # JavaObject--> XML---------");
            out.writeObject(stu);
            out.write(22);//byte
            out.writeBoolean(true);
            out.writeFloat(22.f);
            out.writeUTF("hello");
            failRed("---------ObjectOutputStream # JavaObject--> XML Over---------");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void readXml2Object() {
        try {
            failRed("-----------Xml >>> Bean--------------");
            Student stu = (Student) xstream.fromXML(xstream.toXML(bean));
            fail(stu.toString());
            
            List<Student> list = new ArrayList<Student>();
            list.add(bean);//add
            
            Map<String, Student> map = new HashMap<String, Student>();
            map.put("No.1", bean);//put
            
            bean = new Student();
            bean.setAddress("china");
            bean.setId("2");
            bean.setName("tom");
            list.add(bean);//add
            map.put("No.2", bean);//put
            
            bean = new Student();
            bean.setName("jack");
            list.add(bean);//add
            map.put("No.3", bean);//put
            
            failRed("==========XML >>> List===========");
            List<Student> studetns = (List<Student>) xstream.fromXML(xstream.toXML(list));
            fail("size:" + studetns.size());//3
            for (Student s : studetns) {
                fail(s.toString());
            }
            
            failRed("==========XML >>> Map===========");
            Map<String, Student> maps = (Map<String, Student>) xstream.fromXML(xstream.toXML(map));
            fail("size:" + maps.size());//3
            Set<String> key = maps.keySet();
            Iterator<String> iter = key.iterator();
            while (iter.hasNext()) {
                String k = iter.next();
                fail(k + ":" + map.get(k));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void writeEntity2JETTSON() {
        failRed("=======JettisonMappedXmlDriver===JavaObject >>>> JaonString=========");
        xstream = new XStream(new JettisonMappedXmlDriver());
        xstream.setMode(XStream.NO_REFERENCES);
        xstream.alias("student", Student.class);
        fail(xstream.toXML(bean));
    }
    
    public void writeEntiry2JSON() {
        failRed("======JsonHierarchicalStreamDriver====JavaObject >>>> JaonString=========");
        xstream = new XStream(new JsonHierarchicalStreamDriver());
        //xstream.setMode(XStream.NO_REFERENCES);
        xstream.alias("student", Student.class);
        failRed("-------Object >>>> JSON---------");
        fail(xstream.toXML(bean));
        
        //failRed("========JsonHierarchicalStreamDriver==删除根节点=========");
        //删除根节点
        xstream = new XStream(new JsonHierarchicalStreamDriver() {
            public HierarchicalStreamWriter createWriter(Writer out) {
                return new JsonWriter(out, JsonWriter.DROP_ROOT_MODE);
            }
        });
        //xstream.setMode(XStream.NO_REFERENCES);
        xstream.alias("student", Student.class);
        fail(xstream.toXML(bean));
    }
    
    public void writeList2JSON() {
        failRed("======JsonHierarchicalStreamDriver====JavaObject >>>> JaonString=========");
        JsonHierarchicalStreamDriver driver = new JsonHierarchicalStreamDriver();
        xstream = new XStream(driver);
        //xstream = new XStream(new JettisonMappedXmlDriver());//转换错误
        //xstream.setMode(XStream.NO_REFERENCES);
        xstream.alias("student", Student.class);
        
        List<Student> list = new ArrayList<Student>();
        list.add(bean);//add
        
        bean = new Student();
        bean.setAddress("china");
        bean.setId("5");
        bean.setName("tom");
        list.add(bean);//add
        
        bean = new Student();
        bean.setId("12");
        bean.setName("jack");
        list.add(bean);//add
        
        fail(xstream.toXML(list));
        
        //failRed("========JsonHierarchicalStreamDriver==删除根节点=========");
        //删除根节点
        xstream = new XStream(new JsonHierarchicalStreamDriver() {
            public HierarchicalStreamWriter createWriter(Writer out) {
                return new JsonWriter(out, JsonWriter.DROP_ROOT_MODE);
            }
        });
        xstream.alias("student", Student.class);
        fail(xstream.toXML(list));
    }
    
    
    public void writeMap2JSON() {
        failRed("======JsonHierarchicalStreamDriver==== Map >>>> JaonString=========");
        xstream = new XStream(new JsonHierarchicalStreamDriver());
        //xstream = new XStream(new JettisonMappedXmlDriver());
        xstream.alias("student", Student.class);
        
        Map<String, Student> map = new HashMap<String, Student>();
        map.put("No.1", bean);//put
        
        bean = new Student();
        bean.setAddress("china");
        bean.setId("22");
        bean.setName("tom");
        map.put("No.2", bean);//put
        
        bean = new Student();
        bean.setName("jack");
        map.put("No.3", bean);//put
        
        fail(xstream.toXML(map));
        
        //failRed("========JsonHierarchicalStreamDriver==删除根节点=========");
        //删除根节点
        xstream = new XStream(new JsonHierarchicalStreamDriver() {
            public HierarchicalStreamWriter createWriter(Writer out) {
                return new JsonWriter(out, JsonWriter.DROP_ROOT_MODE);
            }
        });
        xstream.alias("student", Student.class);
        fail(xstream.toXML(map));
    }
    
    public void readJSON2Object() throws JSONException {
        String json = "{\"student\": {" +
            "\"id\": 1," +
            "\"name\": \"haha\"," +
            "\"address\": \"address\"," +
        "}}";
        //JsonHierarchicalStreamDriver读取JSON字符串到java对象出错，但JettisonMappedXmlDriver可以
        xstream = new XStream(new JettisonMappedXmlDriver());
        xstream.alias("student", Student.class);
        fail(xstream.fromXML(json).toString());
        
        //JettisonMappedXmlDriver转换List集合出错，但JsonHierarchicalStreamDriver可以转换正确
        //JettisonMappedXmlDriver 转换的字符串 {"list":{"student":[{"id":1,"name":"haha","email":"email","address":"address","birthday":[{},"2010-11-22"]}]},"student":{"id":2,"name":"tom","email":"tom@125.com","address":"china","birthday":[{},"2010-11-22"]}}
        json = "{\"list\": [{" +
                "\"id\": 1," +
                "\"name\": \"haha\"," +
                "\"address\": \"address\"," +
               "},{" +
                "\"id\": 2," +
                "\"name\": \"tom\"," +
                "\"address\": \"china\"," +
              "}]}";
        System.out.println(json);//用js转换成功
        List list = (List) xstream.fromXML(json);
        System.out.println(list.size());//0好像转换失败
    }
    
    public static void main(String args[]) throws JSONException
    {
    	Test test =new Test();
    	test.init();
    	test.writeBean2XML();
    	System.out.println("================");
//    	test.writeList2XML();
    	System.out.println("================");
    	test.writeMap2XML();
    	System.out.println("================");
    	test.writeXML4OutStream();
    	
    	test.readXml2Object();
    	
    	test.writeEntity2JETTSON();
    	
    	test.writeEntiry2JSON();
    	
    	test.writeList2JSON();
    	
    	test.writeMap2JSON();
    	
    	test.readJSON2Object();
    }
}