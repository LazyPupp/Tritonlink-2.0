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
				String query = "SELECT DISTINCT course_id, course_name, name FROM course_taken3 WHERE year_taken <> 2016;";
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
			
			<form action="3av.jsp" method="get">
				<select name="data">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value='<%=rs.getString("course_name")%>,<%=rs.getString("name")%>'><%=rs.getString("course_name")%>, <%=rs.getString("name")%></option>
					<% } %>
				</select>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
					<th>AVG GPA</th>
                </tr>
				
				<%String dataArray[] = request.getParameter("data").split(",");%>
				
				<%=dataArray[0]%>
				<%=dataArray[1]%>
				
				<%String queryA = "SELECT avg(gc.number_grade) AS avg_gpa " + 
								  "FROM grade_conversion gc, course_taken3 ct3 " + 
								  "WHERE ct3.grade = gc.letter_grade AND ct3.course_name = '" + dataArray[0] + "' AND name = '" + dataArray[1] + "';";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(queryA);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getFloat("avg_gpa")%></td>
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
