<%@ page contentType="text/html; charset=GBK" %>
<%@ include file="/include/Head.jsp"%>
<%@ page import="rtx.RTXSvrApi"%>  
<jsp:useBean id="Logon" class="com.juts.web.bean.Logon" scope="request"/>
<%
	String staff_name =request.getParameter("staff_name");
	String login_type =request.getParameter("login_type");
	//是否集成RTX登陆
    String rtx =request.getParameter("rtx") ==null?"0":request.getParameter("rtx");
    String ip = "", key ="";
	 RTXSvrApi rtxApi = new RTXSvrApi();  
	if(rtx.equals("1"))
	{
		ip =rtxApi.getServerIP();  
		key= rtxApi.getSessionKey(staff_name); //这个GetSessionKey的方法就在RTX SDK下面JAVA例子RTXSvrApi.java里面有  
	}

	String url =null;
	if(login_type ==null || !login_type.equals("ikey"))
		url =Logon.logon(request);
	else
	{
		System.out.println("1232333");
		url =Logon.logonIkey(request);
	}
	if(url ==null)
   {
   %>
      <zz:Error dtype="1"/>
      <script>history.go(-1);</script>
   <%
   }
   else
   {
		//дcookie
		String cookieName="staff_name"; 
		Cookie cookie=new Cookie(cookieName, staff_name); 
		cookie.setMaxAge(10); 
		response.addCookie(cookie);

      if(session.getAttribute("dispatch_url") !=null)
      {
         url =(String)session.getAttribute("dispatch_url");
         session.removeAttribute("dispatch_url");
      }
      else
      {
         if(url.equals(""))
            url ="/main/menu1/index.jsp";
         if(request.getAttribute(GlobalNames.ERROR_ATTR) !=null)
		  {
            url ="/main/login/index.jsp";
		  }
      }
		if(rtx.equals("1"))
		{
		%>
			<body onLoad="onDispatch()">
				<OBJECT classid=clsid:5EEEA87D-160E-4A2D-8427-B6C333FEDA4D id=RTXAX></OBJECT>
			</body>
			<script>
			function onDispatch()
			{
				RtxSycn();
				window.location.href ="<%=GlobalNames.WEB_PATH+url%>";
			}
			function RtxSycn()
			{  
				try
				{  
					var key="<%=key%>";            //上面取到的sessionkey  
					var account="<%=staff_name%>";    //用户登陆名,当然在RTX里面也要有一个一样的用户名  
					var ip="<%=ip%>";  
					var RTXCRoot = RTXAX.GetObject("KernalRoot");    //客户端SDK  
					RTXCRoot.LoginSessionKey(ip,8000,account,key);  
				}
				catch(e)
				{  
					alert("RTX未能成功登陆，请重试或与管理员联系！");  
				}  
			}  
			</script>
		<%
		}
		else
		{
			%>
			<script>window.location.href ="<%=GlobalNames.WEB_PATH+url%>";</script>
			<%
		}
      //getServletConfig().getServletContext().getRequestDispatcher(url).forward(request, response);
   }
%>
