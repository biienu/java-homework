<%@ page import="com.biienu.utils.JdbcUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.biienu.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
</head>
<body>
    <%
        Connection connection = JdbcUtil.getConnection();
        Statement statement = connection.createStatement();
        String sql = "select id, name from t_user";
        ResultSet resultSet = statement.executeQuery(sql);
        List<User> list = new ArrayList<>();
        while(resultSet.next()){
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            User u = new User(id, name);
            list.add(u);
        }
    %>
    <table>
        <tr><th>用户id</th><th>用户姓名</th><th class="text-align" colspan="2">操作</th></tr>
        <%
            for(User u: list){
        %>
            <tr>
                <td><%=u.getId()%></td>
                <td><%=u.getName()%></td>
                <td><a href="delete.jsp?id=<%=u.getId()%>">删除</a></td>
                <td><a href="updateForm.jsp?id=<%=u.getId()%>&name=<%=u.getName()%>">修改</a></td>
            </tr>
        <%
            }
        %>
        <tr><td class="text-align" colspan="4"><a href="addForm.jsp">添加用户</a></td></tr>
    </table>
</body>
<script>

</script>

<style>
    .text-align{
        text-align: center
    }
    table{
        width: auto;
        height: 100px;
        margin-left: 30%;
    }
    table,tr,td,th{
        border: 1px solid gray;
    }
</style>
</html>
