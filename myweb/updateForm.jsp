<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>


<form action="update.jsp" method="get">

    <table>
        <tr><td>用户姓名</td><td><input name="username" type="text" value="<%=request.getParameter("name")%>"/></td></tr>
        <tr><td colspan="2"><input type="submit"  value="确认修改"></td></tr>
    </table>
</form>
</body>
</html>
