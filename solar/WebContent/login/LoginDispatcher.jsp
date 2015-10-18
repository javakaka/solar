<%@ include file="/include/Head.jsp"%>
<jsp:useBean id="Logon" class="com.juts.web.status.Logon" scope="request"/>
<%
	String staff_name =request.getParameter("staff_name");
	String login_type =request.getParameter("login_type");
	String url =null;
	if(login_type ==null || !login_type.equals("ikey"))
		url =Logon.logon(request);
	else
	{
		System.out.println("1232333");
		//url =Logon.logonIkey(request);
	}
	if(url ==null)
   {
   %>
      <$:M dtype="1"/>
      <script>history.go(-1);</script>
   <%
   }
   else
   {
      if(session.getAttribute("dispatch_url") !=null)
      {
         url =(String)session.getAttribute("dispatch_url");
         session.removeAttribute("dispatch_url");
      }
      else
      {
         if(url.equals(""))
            url ="/main/menu5/Index.jsp";
         if(request.getAttribute(ServletUtil._ERROR_TAG) !=null)
		  {
            url ="/main/login/Index.jsp";
		  }
      }
		%>
		<script>window.location.href =WEB_PATH+"<%=url%>";</script>
		<%
      //getServletConfig().getServletContext().getRequestDispatcher(url).forward(request, response);
   }
%>
