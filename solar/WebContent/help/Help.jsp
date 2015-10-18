<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<style>
.subject {
	font-size: 14px;
	font-weight: bold;
	color: #FF8000;
}
.text {
	font-size: 12px;
	color: #666666;
}
.btext {
	font-size: 14px;
	font-weight:bold;
	color: #666666;
}
.refer {
	font-size: 12px;
	color: #0000DE;
}
a
{
	color: #0000DE;
	text-decoration: none;
}

a:hover {
	color: Red;
	text-decoration: underline;
}

.aVisited {
	color: #D6F3F9;
	text-decoration: underline;	
}
</style>
<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<TABLE width=95% align="center">
   <tr class="tr_c"><td colspan=2 width=100%>
            <span class="btext">${row.SUBJECT}</span>
             <table><tr><td width=95%>
               <span class="text">${row.CONTENT}</span>
            </td></tr>
         </table>
      </$:T>
   </td></tr>
</TABLE>
</body>
