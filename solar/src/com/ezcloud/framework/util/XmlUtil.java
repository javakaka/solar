package com.ezcloud.framework.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class XmlUtil {

	private static XStream xstream = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				// true 对所有xml节点的转换都增加CDATA标记,false不加
				boolean cdata = false;

				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});
	
	/**
	 * @return
	 */
	public static String objectToXml(Object obj) {  
		xstream.alias("xml", obj.getClass());  
		return xstream.toXML(obj);  
	}   
	
	public static HashMap<String, String> xmlToMap(String xml)
	{
		HashMap<String, String> map = new HashMap<String, String>();
		SAXReader reader = new SAXReader();
		InputStream inputStream;
		try {
			inputStream = new ByteArrayInputStream(xml.getBytes("UTF-8"));
			Document document;
			document = reader.read(inputStream);
			// 得到xml根元素
			Element root = document.getRootElement();
			// 得到根元素的所有子节点
			List<Element> elementList = root.elements();
			// 遍历所有子节点
			for (Element e : elementList)
			{
				map.put(e.getName(), e.getText());
			}
			// 释放资源
			inputStream.close();
			inputStream = null;
		} catch (UnsupportedEncodingException e1) {
			map =null;
		}
		catch (IOException e1) {
			map =null;
		}
		catch (DocumentException e1) {
			map =null;
		}
		return map;
	}
	
//	public static Object xmlToObjectInputStream(String xml,Class<?> clazz) throws IOException
//	{
//		StringReader reader =new StringReader(xml);
//        ObjectInputStream in = xstream.createObjectInputStream(reader);
//		return in;
//	}
}
