<%@ page language="java" %>
<html>
    <head>
    <title>Maintenance Payment</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            padding: 30px;
        }

        .container {
            width: 350px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        input, select, button {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        button {
            background: green;
            color: white;
            border: none;
            cursor: pointer;
        }

        a {
            color: blue;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Society Maintenance</h2>

    <form action="result.jsp" method="post">
        Flat No: <input type="text" name="flat_no" required><br><br>
        Owner: <input type="text" name="owner" required><br><br>

        Month:
        <select name="month">
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
        </select><br><br>

        Amount: <input type="number" name="amount" min="1" required><br><br>

        <button type="submit">Save Payment</button>
    </form>

    <br>
    <a href="result.jsp">View All Records</a>
</div>
</body>
</html>