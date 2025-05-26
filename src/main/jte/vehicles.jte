@import com.example.scooter.data.Vehicle
@param Iterable<com.example.scooter.data.Vehicle> vehicles

<!DOCTYPE html>
<html>
<head>
    <title>Список транспортних засобів</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 40px;
        }

        h1 {
            text-align: center;
            color: #4a90e2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4a90e2;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0f7fa;
        }
    </style>
</head>
<body>
<h1>Список транспортних засобів</h1>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Тип</th>
        <th>Модель</th>
        <th>Доступність</th>
        <th>Поточне розташування</th>
        <th>Рівень батареї</th>
    </tr>
    </thead>
    <tbody>
    @for (Vehicle vehicle : vehicles)
    <tr>
        <td>${vehicle.id}</td>
        <td>${vehicle.type}</td>
        <td>${vehicle.model}</td>
        <td>${vehicle.available ? "Так" : "Ні"}</td>
        <td>${vehicle.currentLocation}</td>
        <td>${vehicle.batteryLevel}</td>
    </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
