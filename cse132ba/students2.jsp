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
				Student
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
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
							<th></th>
                            <th><input value="" name="firstname" size="10"></th>
                            <th><input value="" name="middlename" size="10"></th>
                            <th><input value="" name="lastname" size="15"></th>
							<th><input value="" name="ssn" size="15"></th>
                            <th><input value="" name="residency" size="15"></th>
                            <th><input value="" name="enrolled" size="15"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    // Iterate over the ResultSet
        
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="students2.jsp" method="post">
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
                        <form action="students2.jsp" method="post">
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
                            "INSERT INTO Undergraduate VALUES (?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("sid")));
						pstmt.setString(2, request.getParameter("college"));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM Undergraduate");
            %>
				<br></br>
				Undergraduate
                <table border="1">
                    <tr>
                        <th>SID</th>
                        <th>College</th>
                    </tr>
                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="sid" size="10"></th>
                            <th><input value="" name="college" size="10"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <input value="<%= rs.getInt("sid") %>" 
                                    name="sid" size="10">
                            </td>
    
                            <td>
                                <input value="<%= rs.getString("college") %>" 
                                    name="college" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="students2.jsp" method="post">
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
                            "INSERT INTO Graduate VALUES (?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("sid")));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM Graduate");
            %>
				
				<br></br>
				Graduate
                <table border="1">
                    <tr>
                        <th>SID</th>
                    </tr>
                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="sid" size="10"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <input value="<%= rs.getInt("sid") %>" 
                                    name="sid" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="students2.jsp" method="post">
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
                            "INSERT INTO MS VALUES (?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("sid")));
						pstmt.setString(2, request.getParameter("concentration"));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM MS");
            %>
				<br></br>
				MS
                <table border="1">
                    <tr>
                        <th>SID</th>
						<th>Concentration</th>
                    </tr>
                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="sid" size="10"></th>
							<th><input value="" name="concentration" size="10"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <input value="<%= rs.getInt("sid") %>" 
                                    name="sid" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("concentration") %>" 
                                    name="concentration" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="students2.jsp" method="post">
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
                            "INSERT INTO PhD VALUES (?, ?)");
						
						pstmt.setInt(1, Integer.parseInt(request.getParameter("sid")));
						pstmt.setString(2, request.getParameter("type_"));
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

                    ResultSet rs = statement.executeQuery("SELECT * FROM PhD");
            %>
			
			<br></br>
			PhD
                <table border="1">
                    <tr>
                        <th>SID</th>
						<th>Type</th>
                    </tr>
                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="sid" size="10"></th>
							<th><input value="" name="type_" size="10"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                    while ( rs.next() ) {
        
            %>

                    <tr>
                        <form action="students2.jsp" method="post">
                            <input type="hidden" value="update" name="action">

                            <td>
                                <input value="<%= rs.getInt("sid") %>" 
                                    name="sid" size="10">
                            </td>
							
							<td>
                                <input value="<%= rs.getString("type_") %>" 
                                    name="type_" size="10">
                            </td>
    
                            <%-- Button --%>
                            <td>
                                <input type="submit" value="Update">
                            </td>
                        </form>
                        <form action="students2.jsp" method="post">
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