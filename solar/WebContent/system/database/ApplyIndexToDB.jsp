<%@ page contentType="text/html; charset=GBK" %>
<%@ include file="/include/Head.jsp"%>
<$:A service="applyIndex" dynamic="false">
  <$:P name="table_ename"/>
</$:A>
<zz:Message text="索引应用到数据表成功"/>
<$:M dtype="1"/>
<script>
   parent.runParentRefresh();
</script>
