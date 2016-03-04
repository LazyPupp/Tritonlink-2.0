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
				String query = "SELECT * FROM Student WHERE enrolled = 1;";
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
			
			<form action="1a.jsp" method="get">
				Student:
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
					<th>Quarter</th>
					<th>Year</th>
					<th>Section ID</th>
                    <th>Course ID</th>
					<th>Units Taken For</th>
					<th>Grade Option</th>
                    <th>Course Name</th>
					<th>Professor</th>
                </tr>
				
				<%String query2 = "SELECT ct3.quarter, ct3.year_taken, ct3.section_id, ct3.course_id, ct3.units_taken_for, ct3.grade_option, ct3.course_name, ct3.name " + 
								  "FROM course_taken3 ct3, Student s " + 
								  "WHERE s.sid = ct3.sid AND ct3.quarter = 'Winter' AND ct3.year_taken = 2016 AND s.ssn = " + request.getParameter("ssn") + ";";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("quarter")%></td>
					<td><%=rs2.getInt("year_taken")%></td>
					<td><%=rs2.getInt("section_id")%></td>
					<td><%=rs2.getInt("course_id")%></td>
					<td><%=rs2.getInt("units_taken_for")%></td>
					<td><%=rs2.getString("grade_option")%></td>
					<td><%=rs2.getString("course_name")%></td>
					<td><%=rs2.getString("name")%></td>
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
