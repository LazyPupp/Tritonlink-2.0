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
                            "INSERT INTO time_period VALUES (?, ?, ?, ?)");
	
						pstmt.setString(1, request.getParameter("start_quarter"));
						pstmt.setInt(2, Integer.parseInt(request.getParameter("start_year")));
						pstmt.setString(3, request.getParameter("end_quarter"));
						pstmt.setInt(4, Integer.parseInt(request.getParameter("end_year")));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM time_period");
            %>

                <table border="1">
                    <tr>
                        <th>TID</th>
						<th>Start Quarter</th>
						<th>Start Year</th>
						<th>End Quarter</th>
						<th>End Year</th>
                    </tr>
                    <tr>
                        <form action="time_period.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
                            <th></th>
							<th>
									<select value="" name="start_quarter">
										<option value="Fall">Fall</option>
										<option value="Winter">Winter</option>
										<option value="Spring">Spring</option>
										<option value="Summer">Summer</option>
									</select>
							</th>
							<th><input value="" name="start_year" size="10"></th>
							<th>
								<select value="" name="end_quarter">
										<option value="Fall">Fall</option>
										<option value="Winter">Winter</option>
										<option value="Spring">Spring</option>
										<option value="Summer">Summer</option>
									</select>
							</th>
							<th><input value="" name="end_year" size="10"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="time_period.jsp" method="get">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <%= rs.getInt("time_id") %>
                            </td>
							
							<td>
                                <input value="<%= rs.getString("start_quarter") %>" 
                                    name="start_quarter" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("start_year") %>" 
                                    name="start_year" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("end_quarter") %>" 
                                    name="end_quarter" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("end_year") %>" 
                                    name="end_year" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="time_period.jsp" method="get">
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
