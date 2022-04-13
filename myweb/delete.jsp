<%@ page import="java.sql.Connection" %>
<%@ page import="com.biienu.utils.JdbcUtil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%

        Connection connection = JdbcUtil.getConnection();
        String sql = "delete from t_user where id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        String id = request.getParameter("id");
        ps.setString(1,id);
        int i = ps.executeUpdate();
        if(i > 0){
            response.sendRedirect("/myweb");
        } else {
            response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.print("<h1>删除失败</h1>");
            pw.flush();
        }
    %>
</body>
</html>
