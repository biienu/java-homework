<%@ page import="java.sql.Connection" %>
<%@ page import="com.biienu.utils.JdbcUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<%
    Connection connection = JdbcUtil.getConnection();
    String sql = "update t_user set name=?";
    PreparedStatement ps = connection.prepareStatement(sql);
    String name = request.getParameter("username");
    ps.setString(1,name);
    int i = ps.executeUpdate();
    if(i > 0){
        response.sendRedirect("/myweb");
    } else {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.print("<h1>修改失败</h1>");
        pw.flush();
    }
%>
</body>
</html>
