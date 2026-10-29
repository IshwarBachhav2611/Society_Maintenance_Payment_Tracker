
<%@ page import="java.sql.*" %>
<html>
    <head>
    <title>Maintenance Records</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            padding: 20px;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background: green;
            color: white;
        }

        select, button {
            padding: 8px;
            margin: 5px;
        }

        button {
            background: green;
            color: white;
            border: none;
            cursor: pointer;
        }

        h3 {
            background: white;
            padding: 10px;
        }

        a {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<h2>Maintenance Records</h2>

<%
String url = "jdbc:mysql://localhost:3306/case_study_db";
String user = "root";
String pass = "ishwar2004";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url, user, pass);

// Save payment
if (request.getMethod().equals("POST")) {
    PreparedStatement insert = con.prepareStatement(
        "INSERT INTO maintenance VALUES(NULL, ?, ?, ?, ?)");

    insert.setString(1, request.getParameter("flat_no"));
    insert.setString(2, request.getParameter("owner"));
    insert.setString(3, request.getParameter("month"));
    insert.setInt(4, Integer.parseInt(request.getParameter("amount")));

    insert.executeUpdate();
    out.println("Payment Saved Successfully!");
    insert.close();
}

// Filter by month
String month = request.getParameter("filter");
String sql = "SELECT * FROM maintenance";

if (month != null && !month.equals("")) {
    sql += " WHERE month = '" + month + "'";
}

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(sql);
int total = 0;
%>

<form action="result.jsp" method="get">
    <select name="filter">
        <option value="">All Months</option>
        <option>January</option>
        <option>February</option>
        <option>March</option>
        <option>April</option>
        <option>May</option>
        <option>June</option>
        <option>July</option>
        <option>August</option>
        <option>September</option>
        <option>October</option>
        <option>November</option>
        <option>December</option>
    </select>
    <button type="submit">Filter</button>
</form>

<table border="1" cellpadding="8">
<tr>
    <th>ID</th>
    <th>Flat No.</th>
    <th>Owner</th>
    <th>Month</th>
    <th>Amount</th>
</tr>

<%
while (rs.next()) {
    total += rs.getInt("amount");
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("flat_no") %></td>
    <td><%= rs.getString("owner") %></td>
    <td><%= rs.getString("month") %></td>
    <td><%= rs.getInt("amount") %></td>
</tr>
<%
}
%>
</table>

<h3>Total Amount: Rs. <%= total %></h3>

<%
rs.close();
st.close();
con.close();
%>

<a href="index.jsp">Add Payment</a>

</body>
</html>
