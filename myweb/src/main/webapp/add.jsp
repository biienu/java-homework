<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.biienu.utils.JdbcUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
    <%
        Connection connection = JdbcUtil.getConnection();
        String sql = "insert into t_user values(?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        String userid = (String) request.getParameter("userid");
        String username = (String) request.getParameter("username");
        statement.setString(1, userid);
        statement.setString(2, username);

        int i = statement.executeUpdate();
        if(i > 0){
            response.sendRedirect("/myweb");
        } else {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.print("<h1>插入失败</h1>");
            pw.flush();
        }
    %>
</body>
</html>
