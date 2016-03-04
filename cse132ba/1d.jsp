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
				String query = "SELECT * FROM Student WHERE enrolled = 1;";
				String query10 = "SELECT deg.degree_id, dept.department_name, deg.degree_type FROM Department dept, Degree deg WHERE dept.department_id = deg.department_id AND deg.degree_type ='B.Sc';";
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
			
			<form action="1d.jsp" method="get">
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
								  "and co.course_id = ct3.course_id and co.department_id = dept.department_id " + 
								  "GROUP BY dept.department_name, deg.degree_type, dr.category, dr.units_completed;";%>
								  
				<%String query3 = "SELECT dept.department_name, deg.degree_type, ec.category, dr.units_completed AS units_req, sum(ct3.units_taken_for) AS units_done, " + 
								  "(dr.units_completed - sum(ct3.units_taken_for)) AS units_left " + 
								  "FROM Department dept, Degree deg, Degree_required dr, Student s, course_taken3 ct3, extra_category ec, Course_Offered co " + 
								  "WHERE deg.department_id = dept.department_id AND dept.department_name = '" + dataArray[1] + "' AND degree_type = '" + dataArray[2] + "' " + 
								  "AND dr.degree_id = deg.degree_id AND s.ssn = " + request.getParameter("ssn") + " and s.sid = ct3.sid and ct3.category = dr.category AND ct3.course_id = ec.course_id " + 
								  "and co.course_id = ec.course_id and co.department_id = dept.department_id " + 
								  "GROUP BY dept.department_name, deg.degree_type, ec.category, dr.units_completed;";%>
				
				
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
				
				<%ResultSet rs3 = stmt3.executeQuery(query3);%>
				<% while(rs3.next()){ %>
				
				<tr>
					<td><%=rs3.getString("department_name")%></td>
					<td><%=rs3.getString("degree_type")%></td>
					<td><%=rs3.getString("category")%></td>
					<td><%=rs3.getInt("units_req")%></td>
					<td><%=rs3.getInt("units_done")%></td>
					<td><%=rs3.getInt("units_left")%></td>
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
