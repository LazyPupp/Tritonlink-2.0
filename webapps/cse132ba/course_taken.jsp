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
                            "INSERT INTO course_taken VALUES (?, ?, ?, ?, ?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("sid")));
						pstmt.setInt(2, Integer.parseInt(request.getParameter("course_id")));
						pstmt.setInt(3, Integer.parseInt(request.getParameter("section_id")));
						pstmt.setString(4, request.getParameter("quarter"));
						pstmt.setInt(5, Integer.parseInt(request.getParameter("year_taken")));
						pstmt.setString(6, request.getParameter("grade"));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM course_taken");
            %>

                <table border="1">
                    <tr>
						<th>ID</th>
                        <th>SID</th>
						<th>CID</th>
						<th>SectionID</th>
						<th>Quarter</th>
						<th>Year</th>
						<th>Grade</th>
                    </tr>
                    <tr>
                        <form action="course_taken.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
                            <th></th>
							<th><input value="" name="sid" size="10"></th>
							<th><input value="" name="course_id" size="10"></th>
							<th><input value="" name="section_id" size="10"></th>
							<th>
								<select value="" name="quarter">
										<option value="Fall">Fall</option>
										<option value="Winter">Winter</option>
										<option value="Spring">Spring</option>
										<option value="Summer">Summer</option>
								</select>
							</th>
							<th><input value="" name="year_taken" size="10"></th>
							<th>
								<select value="" name="grade">
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="D">F</option>
										<option value="D">S</option>
										<option value="D">U</option>
								</select>
							</th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="course_taken.jsp" method="get">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <%= rs.getInt("id") %>
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("sid") %>" 
                                    name="sid" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("course_id") %>" 
                                    name="course_id" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("section_id") %>" 
                                    name="section_id" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("quarter") %>" 
                                    name="quarter" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("year_taken") %>" 
                                    name="year_taken" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("grade") %>" 
                                    name="grade" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="course_taken.jsp" method="get">
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
