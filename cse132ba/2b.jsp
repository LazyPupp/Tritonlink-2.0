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
				String query = "SELECT ct.section_id, co.course_name FROM Course_Taken ct, Course_Class cc, Course co"+ 
								" WHERE ct.section_id = cc.section_id AND cc.course_id = co.course_id AND ct.quarter = 'Winter' AND ct.year_taken = '2016'";
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
			
			<form action="2b.jsp" method="get">
				Section:
				<select name="section_id">
					<option selected disabled>Choose Option</option>
					<% while(rs.next()) {%>
						<option value=<%=rs.getInt("section_id")%>><%=rs.getInt("section_id")%>, <%=rs.getString("course_name")%></option>
					<% } %>
				</select>
				Start Date:
				<Input value = "" name = 'start_date'>
				End Date:
				<Input value = "" name = 'end_date'>
				<input type="submit">			
			</form>

			<table border="1">
				<tr>
					<th>Day of week</th>
                    <th>Start Time</th>
 
                </tr>
				
				<%String query2 = "(SELECT '1. Sunday' as day, rt.start_time as time FROM review_time rt WHERE id NOT IN (SELECT distinct(m.sunday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.sunday IS NOT NULL AND s.ssn IN (SELECT s.ssn  FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+"))) "+ 
								"UNION "+ 
								"(SELECT '2. Monday' as day, rt.start_time as time FROM review_time rt  WHERE id NOT IN (SELECT distinct(m.monday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.monday IS NOT NULL AND s.ssn IN (SELECT s.ssn  FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+" ))) "+ 
								"UNION "+ 
								"(SELECT '3. Tuesday' as day, rt.start_time as time FROM review_time rt  WHERE id NOT IN (SELECT distinct(m.tuesday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.tuesday IS NOT NULL AND s.ssn IN (SELECT s.ssn  FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+"))) "+ 
								"UNION "+ 
								"(SELECT '4. Wednesday' as day, rt.start_time as time FROM review_time rt  WHERE id NOT IN (SELECT distinct(m.wednesday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.wednesday IS NOT NULL AND s.ssn IN (SELECT s.ssn  FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+" ))) "+ 
								"UNION "+ 
								"(SELECT '5. Thursday' as day, rt.start_time as time FROM review_time rt  WHERE id NOT IN (SELECT distinct(m.thursday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.thursday IS NOT NULL AND s.ssn IN (SELECT s.ssn  FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+" ))) "+ 
								"UNION "+ 
								"(SELECT '6. Friday' as day, rt.start_time as time FROM review_time rt  WHERE id NOT IN (SELECT distinct(m.friday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.friday IS NOT NULL AND s.ssn IN (SELECT s.ssn FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+" ))) "+ 
								"UNION "+ 
								"(SELECT '7. Saturday' as day, rt.start_time as time FROM review_time rt  WHERE id NOT IN (SELECT distinct(m.saturday) FROM Course_Taken ct INNER JOIN meeting2b m ON ct.section_id = m.section_id INNER JOIN Student s on s.sid = ct.sid WHERE m.saturday IS NOT NULL AND s.ssn IN (SELECT s.ssn FROM Course_taken ct INNER JOIN Student s on s.sid = ct.sid WHERE section_id = "+ request.getParameter("section_id")+" ))) "+
								"ORDER BY day, time";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("day")%></td>
					<td><%=rs2.getString("time")%></td>
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