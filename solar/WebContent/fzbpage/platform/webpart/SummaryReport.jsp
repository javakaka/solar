<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>数据汇总</title>
<script type="text/javascript" src="<%=basePath%>res/js/report/highcharts/js/jquery-1.8.0.min.js"></script>
<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column',
          	height:'200'
            //width:
        },
        title: {
            text: '数据汇总'
        },
        subtitle: {
            text: '中介、房东租客用户、房源数量汇总图'
        },
        credits: { 
        	enabled:false 
        },
        exporting: { 
        	enabled:false 
        },
        xAxis: {
            categories: [
                '当前日期'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '数量 (个)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y} 个</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '中介用户',
            data: [${agentTotal}]
        }, {
            name: '房东租客',
            data: [${userTotal}]
        }, {
            name: '房源',
            data: [${roomTotal}]
        }]
    });
});
		</script>
	</head>
	<body>
<script src="<%=basePath%>res/js/report/highcharts/js/highcharts.js"></script>
<script src="<%=basePath%>res/js/report/highcharts/js/modules/exporting.js"></script>

<div id="container" style="min-width: 100px; height: 400px; margin: 0 auto"></div>

	</body>
</html>
