<%@ page contentType="text/html; charset=GBK" %>
<%@ include file="/include/Head.jsp"%>
<logic:present parameter="operate">
	<$:E param="operate" value="3">
      <$:A service="saveTableListView" dynamic="false">
         <$:P name="table_ename"/>
         <$:P name="query_fields"/>
         <$:P name="order"/>
         <$:P name="orderby"/>
         <$:P name="rows"/>
      </$:A>
      <$:M dtype="1"/>
	</$:E>
	<logic:notEqual parameter="operate" value="3">
      <$:A service="saveTableStyle" dynamic="false">
         <$:P name="table_ename"/>
         <$:P name="field_ename"/>
         <$:P name="style_id"/>
         <$:P name="operate"/>
      </$:A>
      <$:M dtype="1"/>
   </logic:notEqual>
</logic:present>
<logic:present parameter="savepremission">
   <$:A service="saveTablePremission" dynamic="true">
      <$:P name="table_ename"/>
      <$:P name="secrecy_level"/>
   </$:A>
   <$:M dtype="1"/>
</logic:present>
<logic:present parameter="savetopconfig">
   <$:A service="saveTableTopConfig" dynamic="false">
      <$:P name="card"/>
      <$:P name="comp_type"/>
      <$:P name="action_type"/>
      <$:P name="time_seq"/>
      <$:P name="act_type"/>
      <$:P name="act_name"/>
      <$:P name="config_id"/>
   </$:A>
   <$:M dtype="1"/>
</logic:present>