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
				String query = "SELECT DISTINCT course_id, course_name FROM course_taken3 WHERE year_taken <> 2016;";
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
			
			<form action="3aiv.jsp" method="get">
				<select name="data">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value='<%=rs.getString("course_name")%>'><%=rs.getString("course_name")%></option>
					<% } %>
				</select>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
					<th>Grade</th>
					<th>Number</th>
                </tr>
				
				<%String queryA = "SELECT 'A' AS grade, count(*) as number " + 
								  "FROM course_taken3 WHERE course_name = '" + request.getParameter("data") +
								  "' " +
								  " AND grade like 'A%';";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(queryA);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("grade")%></td>
					<td><%=rs2.getInt("number")%></td>
				</tr>
				
				<% } %>
				
				
				<%String queryB = "SELECT 'B' AS grade, count(*) as number " + 
								  "FROM course_taken3 WHERE course_name = '" + request.getParameter("data") +
								  "' " + 
								  " AND grade like 'B%';";%>
				
				<%rs2 = stmt2.executeQuery(queryB);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("grade")%></td>
					<td><%=rs2.getInt("number")%></td>
				</tr>
				
				<% } %>
				
				<%String queryC = "SELECT 'C' AS grade, count(*) as number " + 
								  "FROM course_taken3 WHERE course_name = '" + request.getParameter("data") + 
								  "' " +
								  " AND grade like 'C%';";%>
				
				<%rs2 = stmt2.executeQuery(queryC);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("grade")%></td>
					<td><%=rs2.getInt("number")%></td>
				</tr>
				
				<% } %>
				
				<%String queryD = "SELECT 'D' AS grade, count(*) as number " + 
								  "FROM course_taken3 WHERE course_name = '" + request.getParameter("data") + 
								  "' "  +
								  " AND grade like 'D%';";%>
				
				<%rs2 = stmt2.executeQuery(queryD);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("grade")%></td>
					<td><%=rs2.getInt("number")%></td>
				</tr>
				
				<% } %>
				
				<%String queryOther = "SELECT 'Other' AS grade, count(*) as number " + 
								  "FROM course_taken3 WHERE course_name = '" + request.getParameter("data") +
								  "' " +
								  " AND grade NOT LIKE 'A%' AND grade NOT LIKE 'B%' AND grade NOT LIKE 'C%' AND grade NOT LIKE 'D%';";%>
				
				<%rs2 = stmt2.executeQuery(queryOther);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("grade")%></td>
					<td><%=rs2.getInt("number")%></td>
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
