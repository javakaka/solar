<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<iframe id="sub" width="100%" height="350" frameborder="0" scrolling="yes" src="./ExecSql.jsp"></iframe>
<script>
	function url(page)
	{
		document.all.sub.src =page;
	}
</script>