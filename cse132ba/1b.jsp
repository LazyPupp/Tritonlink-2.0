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
				String query = "SELECT DISTINCT course_name, quarter, year_taken FROM course_taken3;";
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
			
			<form action="1b.jsp" method="get">
				Class:
				<select name="data">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value='<%=rs.getString("course_name")%>,<%=rs.getString("quarter")%>,<%=rs.getInt("year_taken")%>'><%=rs.getString("course_name")%>, <%=rs.getString("quarter")%>, <%=rs.getInt("year_taken")%></option>
					<% } %>
				</select>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
					<th>SID</th>
                    <th>Firstname</th>
                    <th>Middlename</th>
                    <th>Lastname</th>
					<th>SSN</th>
					<th>Residency</th>
					<th>Units</th>
					<th>Grade Option</th>
                </tr>
				
				<%String dataArray[] = request.getParameter("data").split(",");%>
				<%=dataArray[0]%>
				<%=dataArray[1]%>
				<%=dataArray[2]%>
				
				<%String query2 = "SELECT s.sid, s.firstname, s.middlename, s.lastname, s.ssn, s.residency, ct3.grade_option, ct3.units_taken_for " + 
								  "FROM Student s, course_taken3 ct3 " + 
								  "WHERE s.sid = ct3.sid AND ct3.course_name = '" + dataArray[0] + 
								  "' AND ct3.quarter = '" + dataArray[1] + 
								  "' and ct3.year_taken = " + dataArray[2] + ";";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getInt("sid")%></td>
					<td><%=rs2.getString("firstname")%></td>
					<td><%=rs2.getString("middlename")%></td>
					<td><%=rs2.getString("lastname")%></td>
					<td><%=rs2.getInt("ssn")%></td>
					<td><%=rs2.getString("residency")%></td>
					<td><%=rs2.getInt("units_taken_for")%></td>
					<td><%=rs2.getString("grade_option")%></td>
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
