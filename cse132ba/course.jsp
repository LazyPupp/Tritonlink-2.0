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
                            "INSERT INTO course VALUES (?, ?, ?, ?, ?, ?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("min_units")));
						pstmt.setInt(2, Integer.parseInt(request.getParameter("max_units")));
						pstmt.setString(3, request.getParameter("grade_options"));
						pstmt.setInt(4, Integer.parseInt(request.getParameter("lab_work_req")));
						pstmt.setString(5, request.getParameter("category"));
						pstmt.setString(6, request.getParameter("course_name"));
						pstmt.setInt(7, Integer.parseInt(request.getParameter("consent_req")));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM course");
            %>

                <table border="1">
                    <tr>
                        <th>CID</th>
						<th>Min Units</th>
						<th>Max Units</th>
						<th>Grade Options</th>
						<th>Lab Work Req</th>
						<th>Category</th>
						<th>Course Name</th>
						<th>Consent Req</th>
                    </tr>
                    <tr>
                        <form action="course.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
							<th></th>
							<th><input value="" name="min_units" size="10"></th>
							<th><input value="" name="max_units" size="10"></th>
							<th>
								<select value="" name="grade_options">
										<option value="Letter">Letter</option>
										<option value="S/U">S/U</option>
										<option value="Any">Any</option>
								</select>
							</th>
							<th>
								<select value="" name="lab_work_req">
										<option value="0">No</option>
										<option value="1">Yes</option>
								</select>
							</th>
							<th>
								<select value="" name="category">
										<option value="Lower Division">Lower Division</option>
										<option value="Upper Division">Upper Division</option>
										<option value="Other">Other</option>
								</select>
							</th>
							<th><input value="" name="course_name" size="10"></th>
							<th>
								<select value="" name="consent_req">
										<option value="0">No</option>
										<option value="1">Yes</option>
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
                        <form action="course.jsp" method="get">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <%= rs.getInt("course_id") %>
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("min_units") %>" 
                                    name="min_units" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("max_units") %>" 
                                    name="max_units" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("grade_options") %>" 
                                    name="grade_options" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("lab_work_req") %>" 
                                    name="lab_work_req" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("category") %>" 
                                    name="category" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("course_name") %>" 
                                    name="course_name" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getInt("consent_req") %>" 
                                    name="concentration" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="course.jsp" method="get">
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
