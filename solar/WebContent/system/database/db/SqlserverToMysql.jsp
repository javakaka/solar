<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%@ page import="java.sql.*,com.juts.framework.data.*"%>
<%
String sTable =request.getParameter("table");
if(sTable !=null)
{
	String sJdbcDriver1 ="com.mysql.jdbc.Driver";
	String sJdbcUrl1="jdbc:mysql://localhost/jutsoa?useUnicode=true&amp;characterEncoding=gb2312";
	java.util.Properties dbProps1 =new java.util.Properties();
	dbProps1.put("user", "root");
	dbProps1.put("password", "root");
	Connection oConn1 =null;

	String sJdbcDriver2 ="net.sourceforge.jtds.jdbc.Driver";
	String sJdbcUrl2 ="jdbc:jtds:sqlserver://localhost:1433/NewJutsSoft";
	java.util.Properties dbProps2 =new java.util.Properties();
	dbProps2.put("user", "sa");
	dbProps2.put("password", "lizhi");
	Connection oConn2 =null;
	
	try
	{
		DriverManager.registerDriver((Driver)Class.forName(sJdbcDriver1).newInstance());
		oConn1 =DriverManager.getConnection(sJdbcUrl1, dbProps1);

		DriverManager.registerDriver((Driver)Class.forName(sJdbcDriver2).newInstance());
		oConn2 =DriverManager.getConnection(sJdbcUrl2, dbProps2);
		
		Statement oSt1 =oConn2.createStatement();
		ResultSet oRs1 =oSt1.executeQuery("select * from "+sTable);

		DataSet ods =new DataSet();
		DataSet.convertRsToDataSet(oRs1, ods);
		out.println(ods.size());
		DataAccess.modify("delete from "+sTable, oConn1);
		for(int i=0; i<ods.size(); i++)
		{
			DataAccess.add(sTable, (com.juts.framework.vo.Row)ods.get(i), oConn1);
		}
		out.println("表格"+sTable+"转换成功！");
	}
	finally
	{
		oConn1.close();
		oConn2.close();
	}
}
%>
<form>
	<input type=text name="table">
	<input type=submit value="转换">
</form>