<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_fmt_formatNumber_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/2
  Time(创建时间)： 22:02
  Description(描述)：
  JSTL <fmt:formatNumber> 标签用于格式化数字、百分比和货币。
JSP <fmt:formatNumber> 标签的语法如下：
<fmt:formatNumber
  value="numberValue"
  [type="number|percent|currency"]
  [pattern="pattern"]
  [currencyCode="currencyCode"]
  [currencySymbol="currencySymbol"]
  [groupingUsed="true|false"]
  [maxIntegerDigits="maxIntegerDigits"]
  [minIntegerDigits="minIntegerDigits"]
  [maxFractionDigits="maxFractionDigits"]
  [minFractionDigits="minFractionDigits"]
  [var="varname"]
  [scope="page|request|session|application"] />

其中，[ ]中包含的内容为可选项，对上述参数说明如下表所示：
参数	说明
value	要格式化的数字
type	设置数字的单位，即 number（数字）、currency（货币）、percent（百分数）
pattern	设定显示的格式
currencyCode	设置货币码
currencySymbol	设置货币符号
groupingUsed	设置是否对数字分组，默认为 true。
maxIntegerDigits	设置最多的整数位，若设定的数值少于数字的实际位数时，数字的左边位数会截去相应的位数，例如 123456，maxIntegerDigits 设定为 4，则结果为 3456。
minIntegerDigits	设置最少的整数位，若设定的数值多于数字的实际位数时，会在数字的左边补 0，例如 123，minIntegerDigits 设定为 4，则结果为 123.5。
maxFractionDigits	设置最多小数位数，若设定的数值小于数字的实际小数位数，则会从右边删掉多余位数，例如 123.56，minIntegerDigits 设定为 1，则结果为 123.5。
minFractionDigits	设置最少小数位数，若设定的数值大于数字的实际小数位数，则会从右边补 0。例如 123.56，minFractionDigits 设定为 4，则结果为 123.5600。
var	代表格式化后的数字，若设定了该参数，需要 <c:out> 标签输出。
scope	设定参数 var 的有效范围，默认为 page。
pattern 属性包含的字符说明如下表所示：
符号	描述
0	代表一位数字
E	使用指数格式
#	代表一位数字，若没有则显示 0
.	小数点
,	数字分组分隔符
;	分隔格式
-	使用默认复数前缀
%	百分数
?	千分数
¤	货币符号，使用实际的货币符号代替
X	指定可以作为前缀和后缀的字符
`	在前缀或后缀中引用特殊字符
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="num" value="456972.458687"/>
<!--货币-->
<fmt:formatNumber value="${num}" type="currency" />
<br>
<!--百分数-->
<fmt:formatNumber value="${num}" type="percent" />
<br>
<!--数字-->
<fmt:formatNumber value="${num}" type="number" />
<br>
<!--数字-->
<fmt:formatNumber value="${num}" type="number" pattern="00.00" />
<br>
<!--数字-->
<fmt:formatNumber value="${num}" type="number" pattern="000000000.00" />
<br>
<!--数字-->
<fmt:formatNumber value="${num}" type="number" pattern="##.##" />
<br>
<!--数字-->
<fmt:formatNumber value="${num}" type="number" pattern="##########.###" />
<br>
<!--数字-->
<fmt:formatNumber value="${num}" type="number" pattern="000,000,000" />
<br>
<!--货币-->
<fmt:formatNumber value="${num}" type="currency" currencySymbol="$" />
<br>
<!--货币-->
<fmt:formatNumber value="${num}" type="currency" currencySymbol="@" />
<br>
<!--最大整数位-->
<fmt:formatNumber value="${num}" type="number" maxIntegerDigits="2" />
<br>
<!--最大整数位-->
<fmt:formatNumber value="${num}" type="number" maxIntegerDigits="4" />
<br>
<!--最小整数位-->
<fmt:formatNumber value="${num}" type="number" minIntegerDigits="3" />
<br>
<!--最小整数位-->
<fmt:formatNumber value="${num}" type="number" minIntegerDigits="8" />
<br>
<!--最大小数位-->
<fmt:formatNumber value="${num}" type="number" maxFractionDigits="2" />
<br>
<!--最大小数位-->
<fmt:formatNumber value="${num}" type="number" maxFractionDigits="7" />
<br>
<!--最小小数位-->
<fmt:formatNumber value="${num}" type="number" minFractionDigits="1" />
<br>
<!--最小小数位-->
<fmt:formatNumber value="${num}" type="number" minFractionDigits="9" />
<br>
<!--格式化-->
<fmt:formatNumber value="${num}" type="number" minFractionDigits="9" var="varname" scope="session"/>
<br>
格式化数字：
<c:out value="${sessionScope.varname}" escapeXml="true" default=""/>
<%
    System.out.println(session.getAttribute("varname"));
%>
</body>
</html>
