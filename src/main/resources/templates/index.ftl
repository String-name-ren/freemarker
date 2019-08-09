<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
</head>
<body>

<span style="color :  red"><h3>自定义变量</h3></span>
<#assign var="我是自定义变量111">
${var}
<br/><br/><br/>

<span style="color :  red"><h3>java基本类型</h3></span>
byteVar  :  ${byteVar}<br/>
shortVar  :  ${shortVar}<br/>
intVar  :  ${intVar}<br/>
longVar : ${longVar}<br/>
floatVar : ${floatVar}<br/>
doubleVar : ${doubleVar}<br/>
charVar : ${charVar}<br/>
booleanVar : ${booleanVar?string("yes","no")}

<br/><br/><br/>

<span style="color :  red"><h3>java常用类型</h3></span>
<span style="color :  darkmagenta">freemarker的日期类型对应的java.sql.Date，<br/>如果返回的是java.util.Date直接取值会报错，可以用?string("yyyy-MM-dd HH:mm:ss")转换<br/></span>
strVar : ${strVar!}<br/>
dateVar : ${dateVar!?string("yyyy-MM-dd HH:mm:ss")}<br/>
sqlDate : ${sqlDate!}
<br/><br/><br/>

<span style="color :  red"><h3>java对象</h3></span>
username  :  ${user.username}<br/>
age  :  ${user.age}<br/>
sex  :  ${user.sex}
<br/><br/><br/>

<span style="color :  red"><h3>null值或不存在的变量的处理</h3></span>
<span style="color :  darkmagenta">在变量后边加"!",一般都会在变量后边加"!"以防变量为空或不存在<br/>
在"!"后面可以加默认值<br/>
</span>
nullVar : ${nullVar!}<br/>
不存在 : ${notFound!}<br/>
默认值 : ${notFound!"默认值"}
<br/><br/><br/>

<span style="color :  red"><h3>List数据</h3></span>
<span style="color :  darkmagenta">加两个问号（或者?exists），判断这个变量是不是存在或者为空<br/></span>
<table border="2" >
    <#if goodsList??>
        <#list goodsList as goods >
            <tr>
                <td>${goods.name}</td>
                <td>${goods.price}</td>
            </tr>
        </#list>
    </#if>
</table>
<br/><br/><br/>

<span style="color :  red"><h3>map数据</h3></span>
直接取值：${mapData.xxx} - ${mapData.yyy} - ${mapData.zzz}<br/>
遍历取值：<br/>
    <#if mapData??>
        <#list mapData?keys as key>
            Key: ${key} ， Value: ${mapData[key]}<br/>
        </#list>
    </#if>
<br/><br/><br/>


<span style="color :  red"><h3>富文本</h3></span>
${html}<br/>
${html?html}<br/>
<br/><br/><br/>













</body>
</html>