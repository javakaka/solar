package com.solar.interceptor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.vo.IVO;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.VOConvert;

/**
 * 移动端接口拦截器，实现解密post数据流，验证数据是否合法，并将合法的请求数据解析成请求对象
 * @author JianBoTong
 *
 */
public class ApiInterceptor  implements HandlerInterceptor{
	
	private static Logger logger = Logger.getLogger(ApiInterceptor.class); 
	
	public ApiInterceptor() {
		
    }
	
	private String mappingURL;//利用正则映射到需要拦截的路径   
	
	public String[] allowUrls;
	public void setAllowUrls(String[] allowUrls)
	{  
		this.allowUrls = allowUrls;  
	}  
	
    public void setMappingURL(String mappingURL)
    {    
    	this.mappingURL = mappingURL;    
    }   
    

	/**
	 * 将请求的post数据解析到请求对象
	 * @param request
	 * @throws JException 
	 */
	public IVO proccessRequest(HttpServletRequest request) throws JException
	{
		String sRequestJson =null;
		BufferedReader oBufferedReader = null;
	    if (request.getAttribute("_CLIENT_XML") != null)
	    {
	    	sRequestJson = request.getAttribute("_CLIENT_XML").toString();
	    }
	    else
	    {
	      String tempRequestStr ="";
	      String strLine ="";
	      try {
	        oBufferedReader = request.getReader();
	        strLine = oBufferedReader.readLine();
	        tempRequestStr = "";
	       while (strLine != null)
	        {
	    	   tempRequestStr = tempRequestStr + strLine;
	          strLine = oBufferedReader.readLine();
	        }
	      }
	      catch (IOException e)
	      {
	        e.printStackTrace();
				throw new JException(-1, "读取客户端的数据出错", e);
	      }
	      sRequestJson = tempRequestStr;
	    }
	    if (sRequestJson == null)
	    {
	      throw new JException(-1, "客户端传来的参数为空");
	    }
	    logger.info("解密前的请求字符串==========>>"+sRequestJson);
	    try {
	    	sRequestJson =AesUtil.decode(sRequestJson);
		} catch (Exception pasrseExp) {
			logger.error("解密出错"+pasrseExp.getMessage());
			throw new JException(-9999, "加密解密出错", pasrseExp);
		}
	    logger.info("解密后的请求字符串==========>>"+sRequestJson);
	    IVO iivo = VOConvert.jsonToIvo(sRequestJson);
	    logger.info("客户端请求ivo ====>>"+iivo);
	    return iivo;
	}

	/** 
     * 在业务处理器处理请求之前被调用 
     * 如果返回false 
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 
     * 如果返回true 
     *    执行下一个拦截器,直到所有的拦截器都执行完毕 
     *    再执行被拦截的Controller 
     *    然后进入拦截器链, 
     *    从最后一个拦截器往回执行所有的postHandle() 
     *    接着再从最后一个拦截器往回执行所有的afterCompletion() 
     */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		String url=request.getRequestURL().toString();   
		logger.info("\r\n/*--------------------new request----------------------*/");
		logger.info("1、preHandle-->>url-->>"+url);
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
        if(null != allowUrls && allowUrls.length >=1 )
        {
        	for(String allowUrl : allowUrls)
        	{    
        		if(requestUrl.contains(allowUrl))
        		{
        			logger.info("this uri do not need filter-->>"+allowUrl);
        			return true;
        		}    
        	}  
        }  
		IVO ivo =null;
		try{
			ivo =proccessRequest(request);
		}catch(JException jexp){
			if(jexp.getCode() == -9999)
			{
				logger.info("json数据解密出错");
				OVO ovo =new OVO(-9999,"","请求数据不合法，解密出错");
				sendError(response,ovo);
				return false;
			}
		}
		logger.info("preHandle-->>ivo.ofrom-->>\n"+ivo.oForm);
        request.setAttribute("ivo", ivo);
        return true;
	}

	//在业务处理器处理请求执行完成后,生成视图之前执行的动作
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("2、postHandle-------------------------------->>");
	}
	
    /** 
     * 在DispatcherServlet完全处理完请求后被调用  
     *   当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion() 
     */  
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exp)
			throws Exception {
		logger.info("3、afterCompletion-----------------------------response CharacterEncoding>>"+response.getCharacterEncoding());
		if(exp != null)
		{
			logger.info("------------------- Exception Info "+exp.getMessage());
		}
	}
	
	public void sendError(HttpServletResponse response,OVO ovo) throws IOException, JException
	{
		PrintWriter oPrintWriter = null;
		response.setContentType("text/plain;charset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setCharacterEncoding("UTF-8");
		oPrintWriter = response.getWriter();
		String msg =VOConvert.ovoToJson(ovo);
		oPrintWriter.write(msg);
	}
}
