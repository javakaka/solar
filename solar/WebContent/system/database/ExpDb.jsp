<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script language="JavaScript" type="text/javascript" src="../../res/js/ProBar.js"></script>
<div class="webfx-main-body">
   <br>
   <br>
   <br>
   <div align=center>
   <form onsubmit="openPopProcessBar();">
   &nbsp;&nbsp;&nbsp;&nbsp;此操作对数据库进行全备份。备份文件名为日期.zz，例如 20040501.zz。<br>
   备份文件存储在系统设置的变量中，不明白的地方跟系统管理员联系。
   <br>
   此操作可能会花费一定的时间，请耐心等候...
   <br>
   <br>
   <br>
   <br>
      <input type=submit value="开始备份数据库......" class="btnOut">
      <input type=hidden name="expdb" value="1">
   </form>
   </div>
<$:E param="expdb" value="1">
	<$:A service="Exp_Database" dynamic="false"/>
	<$:M dtype="1"/>
</$:E>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

</div>