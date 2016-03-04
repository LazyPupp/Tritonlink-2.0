<html>

<body>
    <table border="1">
        <tr>
            <td valign="top">
                <%-- -------- Include menu HTML code -------- --%>
                <jsp:include page="menu.html" />
            </td>
            <td>

            <%-- Set the scripting language to Java and --%>
            <%-- Import the java.sql package --%>
            <%@ page language="java" import="java.sql.*" %>
    
            <%-- -------- Open Connection Code -------- --%>
            <%
				Statement stmt = null;
				Statement stmt2 = null;
				String query = "SELECT * FROM Student";
                try {
                    // Load Oracle Driver class file
                    DriverManager.registerDriver
                        (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
    
                    // Make a connection to the Oracle datasource "cse132b"
                    Connection conn = DriverManager.getConnection
                        ("jdbc:sqlserver://localhost:1433;databaseName=cse132b", 
                            "sa", "g");
							
					stmt = conn.createStatement();
					stmt2 = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);

            %>
			
			<form action="1c.jsp" method="get">
				SSN:
				<select name="ssn">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value=<%=rs.getInt("ssn")%>><%=rs.getInt("ssn")%>, <%=rs.getString("firstname")%>, <%=rs.getString("middlename")%>, <%=rs.getString("lastname")%></option>
					<% } %>
				</select>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
                    <th>Section ID</th>
                    <th>Enrollment Limit</th>
                    <th>Quarter</th>
					<th>Year</th>
                    <th>Title</th>
                    <th>Units</th>
					<th>Grade</th>
					
                </tr>
				
				<%String query2 = "SELECT section_id, enrollment_limit, quarter, year_, title, units_taken_for, grade " + 
								  "FROM student_quarter_grades, Student s " + 
								  "WHERE s.ssn = " + request.getParameter("ssn") + " AND s.sid = student_quarter_grades.sid " + 
								  "ORDER BY quarter, year_;";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getInt("section_id")%></td>
					<td><%=rs2.getInt("enrollment_limit")%></td>
					<td><%=rs2.getString("quarter")%></td>
					<td><%=rs2.getInt("year_")%></td>
					<td><%=rs2.getString("title")%></td>
					<td><%=rs2.getInt("units_taken_for")%></td>
					<td><%=rs2.getString("grade")%></td>
				</tr>
				
				<% } %>

			</table>
			
			<br>
			
			<table border = "1">
				<tr>
                    <th>Quarter</th>
                    <th>Year</th>
                    <th>Quarter GPA</th>
                </tr>
				
				<%String query3 = "SELECT quarter, year_, avg(number_grade) AS quarter_gpa " + 
								  "FROM student_quarter_grades, Student s " + 
								  "WHERE s.ssn = " + request.getParameter("ssn") + " AND s.sid = student_quarter_grades.sid " + 
								  "GROUP BY quarter, year_ " + 
								  "ORDER BY quarter, year_;";%>
								  
				<%rs2 = stmt2.executeQuery(query3);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("quarter")%></td>
					<td><%=rs2.getInt("year_")%></td>
					<td><%=rs2.getFloat("quarter_gpa")%></td>
				</tr>
				
				<% } %>

			</table>
			
			<br>
			
			<table border = "1">
				<tr>
                    <th>Cumulative GPA</th>
                </tr>
				
				<%String query4 = "SELECT avg(number_grade) AS cumulative_gpa " +
								  "FROM student_quarter_grades, Student s " + 
								  "WHERE s.ssn = " + request.getParameter("ssn") + " AND s.sid = student_quarter_grades.sid;";%>
								  
				<%rs2 = stmt2.executeQuery(query4);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getFloat("cumulative_gpa")%></td>
				</tr>
				
				<% } %>
			</table>
			

           

            <%-- -------- Close Connection Code -------- --%>
            <%
                    // Close the ResultSet
                    rs.close();
					rs2.close();
                    // Close the Statement
                    stmt.close();
					stmt2.close();
    
                    // Close the Connection
                    conn.close();
                } catch (SQLException sqle) {
                    out.println(sqle.getMessage());
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
				//conn.close;
            %>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>
