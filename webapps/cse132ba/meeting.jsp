<html>

<body>
    <table border="1">
        <tr>
            <td valign="top">
                <jsp:include page="menu.html" />
            </td>
            <td>
            <%@ page language="java" import="java.sql.*" %>
    
            <%-- -------- Open Connection Code -------- --%>
            <%
                try {
                    DriverManager.registerDriver
                        (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
    
                    Connection conn = DriverManager.getConnection
                        ("jdbc:sqlserver://localhost:1433;databaseName=cse132b", 
                            "sa", "g");

            %>

            <%-- -------- INSERT Code -------- --%>
            <%
                    String action = request.getParameter("action");
                    if (action != null && action.equals("insert")) {
                        conn.setAutoCommit(false);
                        PreparedStatement pstmt = conn.prepareStatement(
                            "INSERT INTO meeting VALUES (?, ?, ?, ?, ?, ?, ?)");
						
						pstmt.setString(1, request.getParameter("type_"));
						pstmt.setString(2, request.getParameter("day_of_week"));
						pstmt.setString(3, request.getParameter("start_time"));
						pstmt.setString(4, request.getParameter("end_time"));
						pstmt.setString(5, request.getParameter("room"));
						pstmt.setString(6, request.getParameter("building"));
						pstmt.setInt(7, Integer.parseInt(request.getParameter("mandatory")));
                        int rowCount = pstmt.executeUpdate();

                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- UPDATE Code -------- --%>
            <%
                    if (action != null && action.equals("update")) {

                        conn.setAutoCommit(false);

                        PreparedStatement pstmt = conn.prepareStatement(
                            "UPDATE Student SET ID = ?, FIRSTNAME = ?, " +
                            "MIDDLENAME = ?, LASTNAME = ?, RESIDENCY = ? WHERE SSN = ?");

                        pstmt.setString(1, request.getParameter("ID"));
                        pstmt.setString(2, request.getParameter("FIRSTNAME"));
                        pstmt.setString(3, request.getParameter("MIDDLENAME"));
                        pstmt.setString(4, request.getParameter("LASTNAME"));
                        pstmt.setString(5, request.getParameter("RESIDENCY"));
                        pstmt.setInt(6, Integer.parseInt(request.getParameter("SSN")));
                        int rowCount = pstmt.executeUpdate();

                         conn.commit();
                         conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- DELETE Code -------- --%>
            <%
                    if (action != null && action.equals("delete")) {

                        conn.setAutoCommit(false);

                        PreparedStatement pstmt = conn.prepareStatement(
                            "DELETE FROM Student WHERE SSN = ?");

                        pstmt.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        int rowCount = pstmt.executeUpdate();
						
                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- SELECT Statement Code -------- --%>
            <%
                    Statement statement = conn.createStatement();

                    ResultSet rs = statement.executeQuery("SELECT * FROM meeting");
            %>

                <table border="1">
                    <tr>
                        <th>MID</th>
						<th>type_</th>
						<th>day_of_week</th>
						<th>start_time</th>
						<th>end_time</th>
						<th>Room</th>
						<th>Building</th>
						<th>Mandatory</th>
                    </tr>
                    <tr>
                        <form action="meeting.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
                            <th></th>
							<th>
								<select value="" name="type_">
										<option value="Lecture">Lecture</option>
										<option value="Discussion">Discussion</option>
										<option value="Review">Review</option>
								</select>
							</th>
							<th>
								<select value="" name="day_of_week">
										<option value="Monday">Monday</option>
										<option value="Tuesday">Tuesday</option>
										<option value="Wednesday">Wednesday</option>
										<option value="Thursday">Thursday</option>
										<option value="Friday">Friday</option>
								</select>
							</th>
							<th><input value="" name="start_time" size="10"></th>
							<th><input value="" name="end_time" size="10"></th>
							<th><input value="" name="room" size="10"></th>
							<th><input value="" name="building" size="10"></th>
							<th>
								<select value="" name="mandatory">
										<option value="0">No</option>
										<option value="1">Yes</option>
								</select>
							</th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="meeting.jsp" method="get">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <%= rs.getInt("meeting_id") %>
                            </td>
							
							<td>
                                <input value="<%= rs.getString("type_") %>" 
                                    name="type_" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("day_of_week") %>" 
                                    name="day_of_week" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("start_time") %>" 
                                    name="start_time" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("end_time") %>" 
                                    name="end_time" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("room") %>" 
                                    name="room" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("building") %>" 
                                    name="building" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("mandatory") %>" 
                                    name="mandatory" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="meeting.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Delete">
                            </td>
                        </form>
                    </tr>
            <%
                    }
            %>

            <%-- -------- Close Connection Code -------- --%>
            <%
                    rs.close();

                    statement.close();
    
                    conn.close();
                } catch (SQLException sqle) {
                    out.println(sqle.getMessage());
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>
