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
			
			<form action="1a.jsp" method="get">
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
					<th>SID</th>
                    <th>First</th>
                    <th>Middle</th>
                    <th>Last</th>
					<th>SSN</th>
                    <th>Residency</th>
                    <th>Enrolled</th>
                </tr>
				
				<%String query2 = "SELECT * FROM Student WHERE ssn = " + request.getParameter("ssn");%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getInt("sid")%></td>
					<td><%=rs2.getString("firstname")%></td>
					<td><%=rs2.getString("middlename")%></td>
					<td><%=rs2.getString("lastname")%></td>
					<td><%=rs2.getInt("ssn")%></td>
					<td><%=rs2.getString("residency")%></td>
					<td><%=rs2.getInt("enrolled")%></td>
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
				String query = "SELECT DISTINCT course_id, course_name, name, quarter, year_taken FROM course_taken3 WHERE quarter <> 'Winter' AND year_taken <> 2016;";
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
			
			<form action="3ai.jsp" method="get">
				SSN:
				<select name="data">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value='<%=rs.getString("course_name")%>,<%=rs.getString("name")%>,<%=rs.getString("quarter")%>,<%=rs.getInt("year_taken")%>'><%=rs.getString("course_name")%>, <%=rs.getString("name")%>, <%=rs.getString("quarter")%>, <%=rs.getInt("year_taken")%></option>
					<% } %>
				</select>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
					<th>Course Name</th>
					<th>Name</th>
					<th>Quarter</th>
					<th>Year Taken</th>
                </tr>
				
				<%String dataArray[] = request.getParameter("data").split(",");%>
				<%=dataArray[0]%>
				<%=dataArray[1]%>
				<%=dataArray[2]%>
				<%=dataArray[3]%>
				<%String query2 = "SELECT * FROM course_taken3 WHERE course_name = '" + dataArray[0] + "' AND name = '" + dataArray[1] + "' AND quarter = '" + dataArray[2] + "' AND year_taken = " + dataArray[3] + ";";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("course_name")%></td>
					<td><%=rs2.getString("name")%></td>
					<td><%=rs2.getString("quarter")%></td>
					<td><%=rs2.getInt("year_taken")%></td>
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
