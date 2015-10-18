<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="tableStruCopy" dynamic="false">
	<$:P name="nname" from="request"/>
	<$:P name="table_ename" from="request"/>
</$:A>
<$:M dtype="1"/>
<script>
   parent.runParentRefresh();
</script>
