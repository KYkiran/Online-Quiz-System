<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = (Connection) session.getAttribute("dbConnection");
    PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
    pst.setString(1, username);
    pst.setString(2, password);
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
        session.setAttribute("username", username);
        response.sendRedirect("quiz.jsp");
    } else {
        out.println("Invalid username or password.");
    }
%>
