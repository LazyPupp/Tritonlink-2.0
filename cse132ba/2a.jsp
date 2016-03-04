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
				String query = "SELECT * FROM Student WHERE enrolled = 1";
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
			
			<form action="2a.jsp" method="get">
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
					<th>Student Course</th>
                    <th>Title</th>
					<th>Conflict Course</th>
                    <th>Conflict Title</th>

                </tr>
				
				<%String query2 = "SELECT aa.courseCur,aa.titleCur,aa.courseCon,aa.titleCon "+
								"FROM  "+ 
								"(SELECT d.course_name AS courseCon, d.title AS titleCon, a.course_name AS courseCur, a.title AS titleCur, count(DISTINCT d.section_id) AS countCon, "+
								"count(DISTINCT a.section_id) AS countStu FROM "+
								"(SELECT Distinct co.course_name, c.title,c.section_id, m.meeting_id , c.quarter, c.year_,  m.type_, m.day_of_week, m.start_time, m.end_time "+
								"FROM Student s INNER JOIN Course_Taken ct on s.sid = ct.sid INNER JOIN Class_ c on c.section_id = ct.section_id INNER JOIN Class_Meeting cm on c.section_id = cm.section_id "+ 
								"INNER JOIN Meeting m on cm.meeting_id = m.meeting_id INNER JOIN Course_class cc on cc.section_id = c.section_id INNER JOIN Course co on co.course_id = cc.course_id "+
								"WHERE s.SSN = "  + request.getParameter("ssn")+" AND c.quarter = 'Winter' And c.year_ = '2016' ) a "+
								"INNER JOIN "+
								"(SELECT * FROM "+
								"(SELECT co.course_name, c.title,c.section_id, m.meeting_id, m.type_, m.day_of_week, m.start_time, m.end_time "+
								"FROM Class_ c Inner Join Course_Class cc on c.section_id = cc.section_id "+
								"Inner Join Class_Meeting cm on cm.section_id = c.section_id Inner Join Meeting m on m.meeting_id = cm.meeting_id "+
								"Inner Join Course co on co.course_id = cc.course_id "+
								"WHERE  c.quarter = 'Winter' AND c.year_ = '2016')b)d on a.start_time = d.start_time "+
								"WHERE a.course_name <> d.course_name AND a.day_of_week = d.day_of_week "+
								"Group By a.course_name,a.title,d.course_name, d.title, a.section_id,d.section_id )aa INNER JOIN (SELECT count (cc.course_id) AS sectionC, co.course_name "+ 
								"FROM Course co Inner Join Course_Class cc on cc.course_id = co.course_id INNER JOIN Class_ c on cc.section_id = c.section_id "+
								"WHERE c.quarter = 'Winter' AND c.year_ = '2016' "+
								"GROUP BY cc.course_id, co.course_name)bb on aa.courseCon = bb.course_name "+
								"WHERE countCon = sectionC";%>
				
				<%ResultSet rs2 = stmt2.executeQuery(query2);%>
				<% while(rs2.next()){ %>
				
				<tr>
					<td><%=rs2.getString("courseCur")%></td>
					<td><%=rs2.getString("titleCur")%></td>
					<td><%=rs2.getString("courseCon")%></td>
					<td><%=rs2.getString("titleCon")%></td>
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