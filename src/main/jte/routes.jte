@import com.example.scooter.data.Route
@param Iterable<com.example.scooter.data.Route> routes


<!DOCTYPE html>
<html>
<head>
    <title>Routes List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f5;
            padding: 20px;
        }

        h1 {
            color: #4b0082; /* темний фіолетовий */
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(107, 0, 255, 0.15);
            overflow: hidden;
        }

        th, td {
            padding: 12px 20px;
            text-align: left;
        }

        thead {
            background: linear-gradient(90deg, #3b82f6, #9333ea, #ec4899);
            color: white;
            font-weight: 600;
        }

        tbody tr:hover {
            background-color: #f9f6ff;
        }

        /* Стиль для бейджів у колонці ID */
        td:first-child {
            padding: 10px;
        }

        td:first-child > .badge {
            display: inline-block;
            min-width: 36px;
            height: 36px;
            line-height: 36px;
            border-radius: 50%;
            font-weight: bold;
            color: white;
            text-align: center;
            box-shadow:
                    0 0 8px rgba(107, 0, 255, 0.6),
                    0 4px 10px rgba(236, 72, 153, 0.5);
            background: linear-gradient(135deg, #3b82f6, #9333ea, #ec4899);
            user-select: none;
        }
    </style>
</head>
<body>
<h1>Список маршрутів</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Початкова точка</th>
        <th>Кінцева точка</th>
        <th>Відстань (км)</th>
        <th>Рівень складності</th>
    </tr>
    </thead>
    <tbody>
    @for ( Route route : routes)
    <tr>
        <td>${ route.id }</td>
        <td>${ route.startPoint }</td>
        <td>${ route.endPoint }</td>
        <td>${ route.distanceKm }</td>
        <td>${ route.difficultyLevel }</td>
    </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
