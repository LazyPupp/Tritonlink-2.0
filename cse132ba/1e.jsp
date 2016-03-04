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
				Statement stmt3 = null;
				String query = "SELECT s.* from Student s, MS m WHERE s.sid = m.sid and s.enrolled = 1;";
				String query10 = "SELECT deg.degree_id, dept.department_name, deg.degree_type FROM Department dept, Degree deg WHERE dept.department_id = deg.department_id AND " + 
								 "deg.degree_type ='M.S' and deg.concentration IS NULL;";
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
					stmt3 = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					ResultSet rs10 = stmt2.executeQuery(query10);

            %>
			
			<form action="1e.jsp" method="get">
				SSN:
				<select name="ssn">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value=<%=rs.getInt("ssn")%>><%=rs.getInt("ssn")%>, <%=rs.getString("firstname")%>, <%=rs.getString("middlename")%>, <%=rs.getString("lastname")%></option>
					<% } %>
				</select>
				Degree:
				<select name="degree_id">
					<option selected disabled>Choose Option</option>
					<% while(rs10.next()) {%>
						<option value='<%=rs10.getInt("degree_id")%>,<%=rs10.getString("department_name")%>,<%=rs10.getString("degree_type")%>'><%=rs10.getString("department_name")%>, <%=rs10.getString("degree_type")%></option>
					<% } %>
				</select>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
					<th>Department</th>
                    <th>Degree Type</th>
                    <th>Category</th>
                    <th>Units Req.</th>
					<th>Units Done</th>
                    <th>Units Left</th>
                </tr>
				
				<%String dataArray[] = request.getParameter("degree_id").split(",");%>
				
				<%=dataArray[0]%>
				<%=dataArray[1]%>
				<%=dataArray[2]%>
				
				<%String query2 = "SELECT dept.department_name, deg.degree_type, dr.category, dr.units_completed AS units_req, sum(ct3.units_taken_for) AS units_done, (dr.units_completed - sum(ct3.units_taken_for)) AS units_left " + 
								  "FROM Department dept, Degree deg, Degree_required dr, Student s, course_taken3 ct3, Course_Offered co " + 
								  "WHERE deg.department_id = dept.department_id AND dept.department_name = '" + dataArray[1] + "' AND degree_type = '" + dataArray[2] + "' " + 
								  "AND dr.degree_id = deg.degree_id AND s.ssn = " + request.getParameter("ssn") + " and s.sid = ct3.sid and ct3.category = dr.category " + 
								  "and co.course_id = ct3.course_id and co.department_id = dept.department_id and deg.concentration IS NULL " + 
								  "GROUP BY dept.department_name, deg.degree_type, dr.category, dr.units_completed;";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("department_name")%></td>
					<td><%=rs2.getString("degree_type")%></td>
					<td><%=rs2.getString("category")%></td>
					<td><%=rs2.getInt("units_req")%></td>
					<td><%=rs2.getInt("units_done")%></td>
					<td><%=rs2.getInt("units_left")%></td>
				</tr>
				
				<% } %>
				
			</table>
			
			<hr>
			Completed Concentrations
			<table border="1">
				<tr>
					<th>Concentration</th>
                    <th>Units Req</th>
                    <th>Units Done</th>
                    <th>Min GPA</th>
					<th>GPA</th>
                </tr>
				
				<%String query3 = "SELECT c.concentration_name, units AS units_req, sum(units_taken_for) AS units_done, c.min_gpa, avg(gc.number_grade) AS gpa " + 
								  "FROM course_taken3 ct3, Student s, concentration c, grade_conversion gc " + 
								  "WHERE s.ssn = " + request.getParameter("ssn") + " AND s.sid = ct3.sid and ct3.course_id = c.course_id and ct3.grade = gc.letter_grade " + 
								  "GROUP BY c.concentration_name, c.units, min_gpa;";%>
								  
				<%ResultSet rs3 = stmt3.executeQuery(query3);%>
				
				<% while(rs3.next()){ %>
					<%if((rs3.getInt("units_done") >= rs3.getInt("units_req")) && (rs3.getFloat("gpa") >= rs3.getFloat("min_gpa"))){%>
					<tr>
						<td><%=rs3.getString("concentration_name")%></td>
						<td><%=rs3.getInt("units_req")%></td>
						<td><%=rs3.getInt("units_done")%></td>
						<td><%=rs3.getFloat("min_gpa")%></td>
						<td><%=rs3.getFloat("gpa")%></td>
					</tr>
				
					<% } %>
				<% } %>
				
			</table>
			
			<hr>
			
			<table border="1">
				<tr>
					<th>Course Name</th>
                    <th>Quarter</th>
                    <th>Year</th>
                </tr>
				
				<%String query4 = "SELECT t2.course_name, cl.quarter, cl.year_ FROM (SELECT * FROM (SELECT course_name FROM concentration c, course co " + 
								  "WHERE c.course_id = co.course_id) t1 EXCEPT (SELECT ct3.course_name " + 
								  "FROM student s, concentration c, course_taken3 ct3 " + 
								  "WHERE s.ssn = " + request.getParameter("ssn") + " and s.sid = ct3.sid and c.course_id = ct3.course_id)) t2, Course co, Class_ cl, Course_Class cc " + 
								  "WHERE t2.course_name = co.course_name and cc.section_id = cl.section_id and cc.course_id = co.course_id AND " + 
								  "cl.year_ >= 2016 AND NOT (cl.year_ = 2016 and cl.quarter = 'Winter');";%>
								  
				<%ResultSet rs4 = stmt3.executeQuery(query4);%>
				
				<% while(rs4.next()){ %>
					<tr>
						<td><%=rs4.getString("course_name")%></td>
						<td><%=rs4.getString("quarter")%></td>
						<td><%=rs4.getInt("year_")%></td>
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


