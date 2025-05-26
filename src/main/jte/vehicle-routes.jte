@import com.example.scooter.data.VehicleRoutes
@param Iterable<VehicleRoutes> vehicleRoutes

<!DOCTYPE html>
<html>
<head>
    <title>Vehicle to Route Mapping</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #007BFF;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        th, td {
            padding: 10px 15px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f0f8ff;
        }

        tr:hover {
            background-color: #e0f7fa;
        }
    </style>
</head>
<body>
<h1>Зв’язок Транспорт — Маршрут</h1>
<table>
    <thead>
    <tr>
        <th>Vehicle ID</th>
        <th>Марка ТЗ</th>
        <th>Route ID</th>
        <th>Початкова точка</th>
        <th>Кінцева точка</th>
    </tr>
    </thead>
    <tbody>
    @for (VehicleRoutes vr : vehicleRoutes)
        <tr>
            <td>${vr.vehicle.id}</td>
            <td>${vr.vehicle.model}</td>
            <td>${vr.route.id}</td>
            <td>${vr.route.startPoint}</td>
            <td>${vr.route.endPoint}</td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
