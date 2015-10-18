package com.ezcloud.framework.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.ezcloud.framework.vo.DataSet;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2015-3-3 下午5:42:00  
 * 类说明: 
 */
public class HtmlUtils {

	public HtmlUtils() {
	}
	
	public static String fillImgSrcWithDomain(String domain,String html)
	{
		String patternStr="<img\\s*([^>]*)\\s*src=\\\"(.*?)\\\"\\s*([^>]*)>";  
	      Pattern pattern = Pattern.compile(patternStr,Pattern.CASE_INSENSITIVE);  
	      Matcher matcher = pattern.matcher(html);  
	      String result = html;  
	      while(matcher.find()) {  
	          String src = matcher.group(2);  
	          String replaceSrc = "";  
	          if(src.lastIndexOf(".")>0){  
	              replaceSrc = src.substring(0,src.lastIndexOf("."))+src.substring(src.lastIndexOf("."));  
	          }  
	          if(!src.startsWith("http://")&&!src.startsWith("https://")){  
	              replaceSrc = domain + replaceSrc;  
	          }  
	          result = result.replaceAll(src,replaceSrc);  
	      }   
	      return result;  
	}
	
	@SuppressWarnings("unchecked")
	public static DataSet findAllImgTag(String html)
	{
		DataSet ds =new DataSet();
        Pattern p = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");//<img[^<>]*src=[\'\"]([0-9A-Za-z.\\/]*)[\'\"].(.*?)>");
        Matcher m = p.matcher(html);
//        System.out.println(m.find());
//        System.out.println(m.groupCount());
        while(m.find()){
        	ds.add(m.group());
//            System.out.println(m.group()+"-------------↓↓↓↓↓↓");
//            System.out.println(m.group(1));
        }
		return ds;
	}
  
  /** 
   * 将img标签中的src进行二次包装 
   * @param content 内容 
   * @param replaceHttp 需要在src中加入的域名 
   * @param size 需要在src中将文件名加上_size 
   * @return 
   */  
  public static String repairContent(String content,String replaceHttp){  
      String patternStr="<img\\s*([^>]*)\\s*src=\\\"(.*?)\\\"\\s*([^>]*)>";  
      Pattern pattern = Pattern.compile(patternStr,Pattern.CASE_INSENSITIVE);  
      Matcher matcher = pattern.matcher(content);  
      String result = content;  
      while(matcher.find()) {  
          String src = matcher.group(2);  
          String replaceSrc = "";  
          if(src.lastIndexOf(".")>0){  
              replaceSrc = src.substring(0,src.lastIndexOf("."))+src.substring(src.lastIndexOf("."));  
          }  
          if(!src.startsWith("http://")&&!src.startsWith("https://")){  
              replaceSrc = replaceHttp + replaceSrc;  
          }  
          result = result.replaceAll(src,replaceSrc);  
      }   
      return result;  
  } 

  public static void main(String[] args) {  
      String content = "<p><img  title=\"10010001\" src=\"/files/post/10010001.gif\" width=\"200\" height=\"300\" />" +  
              "</p><p><img  title=\"10010002\" src=\"/files/post/10010002.gif\" width=\"500\" height=\"300\" /><p>&nbsp;</p>"+  
              "</p><p><img  title=\"10010003\" src=\"/files/post/10010003.gif\" width=\"600\" height=\"300\" /><p>&nbsp;</p>";  
      String replaceHttp = "http://www.baidu.com";  
//      int size = 500;  
      String result = repairContent(content, replaceHttp);  
      System.out.println(" result == " + result);  
      result = fillImgSrcWithDomain(replaceHttp,content);
      System.out.println(" result22 == " + result);  
  }  
}
