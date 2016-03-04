<html>

<body>
    <table border="1">
        <tr>
            <td valign="top">
                <jsp:include page="menu.html" />
            </td>
            <td>
            <%@ page language="java" import="java.sql.*" %>
    
            <%-- -------- Open Connection Code -------- --%>
            <%
                try {
                    DriverManager.registerDriver
                        (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
    
                    Connection conn = DriverManager.getConnection
                        ("jdbc:sqlserver://localhost:1433;databaseName=cse132b", 
                            "sa", "g");

            %>

            <%-- -------- INSERT Code -------- --%>
            <%
                    String action = request.getParameter("action");
                    if (action != null && action.equals("insert")) {
                        conn.setAutoCommit(false);
                        PreparedStatement pstmt = conn.prepareStatement(
                            "INSERT INTO degree_required VALUES (?, ?, ?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("department_id")));
						pstmt.setInt(2, Integer.parseInt(request.getParameter("degree_id")));
						pstmt.setString(3, request.getParameter("category"));
						pstmt.setInt(4, Integer.parseInt(request.getParameter("units_completed")));
                        int rowCount = pstmt.executeUpdate();

                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- UPDATE Code -------- --%>
            <%
                    if (action != null && action.equals("update")) {

                        conn.setAutoCommit(false);

                        PreparedStatement pstmt = conn.prepareStatement(
                            "UPDATE Student SET ID = ?, FIRSTNAME = ?, " +
                            "MIDDLENAME = ?, LASTNAME = ?, RESIDENCY = ? WHERE SSN = ?");

                        pstmt.setString(1, request.getParameter("ID"));
                        pstmt.setString(2, request.getParameter("FIRSTNAME"));
                        pstmt.setString(3, request.getParameter("MIDDLENAME"));
                        pstmt.setString(4, request.getParameter("LASTNAME"));
                        pstmt.setString(5, request.getParameter("RESIDENCY"));
                        pstmt.setInt(6, Integer.parseInt(request.getParameter("SSN")));
                        int rowCount = pstmt.executeUpdate();

                         conn.commit();
                         conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- DELETE Code -------- --%>
            <%
                    if (action != null && action.equals("delete")) {

                        conn.setAutoCommit(false);

                        PreparedStatement pstmt = conn.prepareStatement(
                            "DELETE FROM Student WHERE SSN = ?");

                        pstmt.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        int rowCount = pstmt.executeUpdate();
						
                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- SELECT Statement Code -------- --%>
            <%
                    Statement statement = conn.createStatement();

                    ResultSet rs = statement.executeQuery("SELECT * FROM degree_required");
            %>

                <table border="1">
                    <tr>
                        <th>Dept ID</th>
						<th>Degree ID</th>
						<th>Category</th>
						<th>Units Completed</th>
                    </tr>
                    <tr>
                        <form action="degree_required.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="department_id" size="10"></th>
							<th><input value="" name="degree_id" size="10"></th>
							<th>
								<select value="" name="category">
										<option value="Lower Division">Lower Division</option>
										<option value="Upper Division">Upper Division</option>
										<option value="Other">Other</option>
								</select>
							</th>
							<th><input value="" name="units_completed" size="10"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="degree_required.jsp" method="get">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <input value="<%= rs.getInt("department_id") %>" 
                                    name="department_id" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("degree_id") %>" 
                                    name="degree_id" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("category") %>" 
                                    name="category" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("units_completed") %>" 
                                    name="units_completed" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="degree_required.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Delete">
                            </td>
                        </form>
                    </tr>
            <%
                    }
            %>

            <%-- -------- Close Connection Code -------- --%>
            <%
                    rs.close();

                    statement.close();
    
                    conn.close();
                } catch (SQLException sqle) {
                    out.println(sqle.getMessage());
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>
