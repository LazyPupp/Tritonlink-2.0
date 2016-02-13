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
                try {
                    // Load Oracle Driver class file
                    DriverManager.registerDriver
                        (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
    
                    // Make a connection to the Oracle datasource "cse132b"
                    Connection conn = DriverManager.getConnection
                        ("jdbc:sqlserver://localhost:1433;databaseName=cse132b", 
                            "sa", "g");

            %>

            <%-- -------- INSERT Code -------- --%>
            <%
                    String action = request.getParameter("action");
                    // Check if an insertion is requested
                    if (action != null && action.equals("insert")) {

                        // Begin transaction
                        conn.setAutoCommit(false);
                        
                        // Create the prepared statement and use it to
                        // INSERT the student attributes INTO the Student table.
                        PreparedStatement pstmt = conn.prepareStatement(
                            "INSERT INTO Student VALUES (?, ?, ?, ?, ?, ?)");
						
						pstmt.setString(1, request.getParameter("firstname"));
						pstmt.setString(2, request.getParameter("middlename"));
						pstmt.setString(3, request.getParameter("lastname"));
						pstmt.setInt(4, Integer.parseInt(request.getParameter("ssn")));
						pstmt.setString(5, request.getParameter("residency"));
						pstmt.setInt(6, Integer.parseInt(request.getParameter("enrolled")));
                        int rowCount = pstmt.executeUpdate();

                        // Commit transaction
                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- UPDATE Code -------- --%>
            <%
                    // Check if an update is requested
                    if (action != null && action.equals("update")) {

                        // Begin transaction
                        conn.setAutoCommit(false);
                        
                        // Create the prepared statement and use it to
                        // UPDATE the student attributes in the Student table.
                        PreparedStatement pstmt = conn.prepareStatement(
                            "UPDATE Student firstname = ?, middlename = ?, " +
                            "lastname = ?, ssn = ?, residency = ? enrolled = ?");

                        pstmt.setString(1, request.getParameter("firstname"));
                        pstmt.setString(2, request.getParameter("middlename"));
                        pstmt.setString(3, request.getParameter("lastname"));
                        pstmt.setInt(4, Integer.parseInt(request.getParameter("ssn")));
                        pstmt.setString(5, request.getParameter("residency"));
                        pstmt.setInt(
                            6, Integer.parseInt(request.getParameter("enrolled")));
                        int rowCount = pstmt.executeUpdate();

                        // Commit transaction
                         conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- DELETE Code -------- --%>
            <%
                    // Check if a delete is requested
                    if (action != null && action.equals("delete")) {

                        // Begin transaction
                        conn.setAutoCommit(false);
                        
                        // Create the prepared statement and use it to
                        // DELETE the student FROM the Student table.
                        PreparedStatement pstmt = conn.prepareStatement(
                            "DELETE FROM Student WHERE SSN = ?");

                        pstmt.setInt(
                            1, Integer.parseInt(request.getParameter("SSN")));
                        int rowCount = pstmt.executeUpdate();

                        // Commit transaction
                         conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>

            <%-- -------- SELECT Statement Code -------- --%>
            <%
                    // Create the statement
                    Statement statement = conn.createStatement();

                    // Use the created statement to SELECT
                    // the student attributes FROM the Student table.
                    ResultSet rs = statement.executeQuery
                        ("SELECT * FROM Student");
            %>

            <!-- Add an HTML table header row to format the results -->
                <table border="1">
                    <tr>
						<th>SID</th>
                        <th>First</th>
                        <th>Middle</th>
                        <th>Last</th>
						<th>SSN</th>
                        <th>Residency</th>
                        <th>Enrolled</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
							<th></th>
                            <th><input value="" name="firstname" size="10"></th>
                            <th><input value="" name="middlename" size="10"></th>
                            <th><input value="" name="lastname" size="15"></th>
							<th><input value="" name="ssn" size="15"></th>
                            <th>
								<select value ="" name="residency">
									<option value="California" selected="selected">California</option>
									<option value="Foreign">Foreign</option>
									<option value="Non-CA US">Non-CA US</option>
								</select>
							</th>
                            <th>
								<select value="" name="enrolled">
									<option value="0">No</option>
									<option value="1">Yes</option>
								</select>
							</th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    // Iterate over the ResultSet
        
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">

							<td>
								<%=rs.getInt("sid")%>
							</td>
                            <td>
                                <input value="<%= rs.getString("firstname") %>" 
                                    name="firstname" size="10">
                            </td>
    
                            <td>
                                <input value="<%= rs.getString("middlename") %>" 
                                    name="middlename" size="10">
                            </td>
    
                            <td>
                                <input value="<%= rs.getString("lastname") %>" 
                                    name="lastname" size="10">
                            </td>
    
                            <td>
                                <input value="<%= rs.getInt("ssn") %>" 
                                    name="ssn" size="15">
                            </td>
    
                            <td>
                                <input value="<%= rs.getString("residency") %>" 
                                    name="residency" size="15">
                            </td>

                            <td>
                                <input value="<%= rs.getString("enrolled") %>" 
                                    name="enrolled" size="15">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" 
                                value="<%= rs.getInt("SSN") %>" name="SSN">
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
                    // Close the ResultSet
                    rs.close();
    
                    // Close the Statement
                    statement.close();
    
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
