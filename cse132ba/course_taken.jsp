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
                            "INSERT INTO course_taken VALUES (?, ?, ?, ?, ?, ?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("sid")));
						pstmt.setInt(2, Integer.parseInt(request.getParameter("section_id")));
						pstmt.setString(3, request.getParameter("quarter"));
						pstmt.setInt(4, Integer.parseInt(request.getParameter("year_taken")));
						pstmt.setInt(5, Integer.parseInt(request.getParameter("units_taken_for")));
						pstmt.setString(6, request.getParameter("grade_option"));
						pstmt.setString(7, request.getParameter("grade"));
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
                            "UPDATE course_taken SET grade = ? WHERE id = ?");

                        pstmt.setString(1, request.getParameter("grade"));
                        pstmt.setInt(2, Integer.parseInt(request.getParameter("id")));
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
                        <th>Student ID</th>
						<th>Section ID</th>
						<th>Quarter</th>
						<th>Year</th>
						<th>Units</th>
						<th>Grade Option</th>
						<th>Grade</th>
                    </tr>
                    <tr>
                        <form action="course_taken.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
                            <th></th>
							<th><input value="" name="sid" size="10"></th>
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
							<th><input value="" name="units_taken_for" size="10"></th>
							<th>
								<select value="" name="grade_option">
										<option value="Letter">Letter</option>
										<option value="S/U">S/U</option>
								</select>
							</th>
							<th>
								<select value="" name="grade">
										<option value="A+">A+</option>
										<option value="A">A</option>
										<option value="A-">A-</option>
										<option value="B+">B+</option>
										<option value="B">B</option>
										<option value="B-">B-</option>
										<option value="C+">C+</option>
										<option value="C">C</option>
										<option value="C-">C-</option>
										<option value="D">D</option>
										<option value="F">F</option>
										<option value="S">S</option>
										<option value="U">U</option>
										<option value="null">null</option>
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
								<input value = "<%= rs.getInt("id") %>"
									name = "id" size = "10" readonly>
							</td>
							
							<td>
								<input value = "<%= rs.getInt("sid") %>"
									name = "sid" size = "10" readonly>
							</td>
							
							<td>
								<input value = "<%= rs.getInt("section_id") %>"
									name = "section_id" size = "10" readonly>
							</td>
							
							<td>
								<input value = "<%= rs.getString("quarter") %>"
									name = "quarter" size = "10" readonly>
							</td>
							
							<td>
								<input value = "<%= rs.getInt("year_taken") %>"
									name = "year_taken" size = "10" readonly>
							</td>
							
							<td>
                                <input value = "<%= rs.getInt("units_taken_for") %>"
									name = "units_taken_for" size = "10" readonly>
                            </td>
							
							<td>
                                <input value = "<%= rs.getString("grade_option") %>"
									name = "grade_option" size = "10" readonly>
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
