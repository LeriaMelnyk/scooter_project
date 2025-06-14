@import com.example.scooter.data.Vehicle
@param Iterable<com.example.scooter.data.Vehicle> vehicles
@param String sortBy
@param String search

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Транспортні засоби | ScooterHub</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #667eea;
            --primary-dark: #5a67d8;
            --secondary-color: #764ba2;
            --accent-color: #f093fb;
            --success-color: #48bb78;
            --warning-color: #ed8936;
            --danger-color: #f56565;
            --text-primary: #2d3748;
            --text-secondary: #718096;
            --bg-primary: #f7fafc;
            --bg-secondary: #edf2f7;
            --bg-card: #ffffff;
            --border-color: #e2e8f0;
            --shadow-sm: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, var(--bg-primary) 0%, var(--bg-secondary) 100%);
            color: var(--text-primary);
            line-height: 1.6;
            min-height: 100vh;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .header h1 {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
            animation: fadeInUp 0.8s ease-out;
        }

        .header p {
            color: var(--text-secondary);
            font-size: 1.1rem;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--bg-card);
            padding: 1.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
            text-align: center;
            transition: all 0.3s ease;
            animation: fadeInUp 0.6s ease-out;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .stat-icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: var(--primary-color);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-primary);
        }

        .stat-label {
            color: var(--text-secondary);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table-container {
            background: var(--bg-card);
            border-radius: 20px;
            box-shadow: var(--shadow-lg);
            overflow: hidden;
            border: 1px solid var(--border-color);
            animation: fadeInUp 0.8s ease-out 0.4s both;
        }

        .table-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 1.5rem 2rem;
            color: white;
        }

        .table-title {
            font-size: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 1rem 1.5rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        th {
            background: var(--bg-secondary);
            font-weight: 600;
            color: var(--text-primary);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            position: sticky;
            top: 0;
        }

        tbody tr {
            transition: all 0.2s ease;
        }

        tbody tr:hover {
            background: linear-gradient(90deg, rgba(102, 126, 234, 0.05), rgba(240, 147, 251, 0.05));
            transform: scale(1.01);
        }

        .vehicle-id {
            font-weight: 600;
            color: var(--primary-color);
        }

        .vehicle-type {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.25rem 0.75rem;
            background: var(--bg-secondary);
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-available {
            background: rgba(72, 187, 120, 0.1);
            color: var(--success-color);
        }

        .status-unavailable {
            background: rgba(245, 101, 101, 0.1);
            color: var(--danger-color);
        }

        .battery-container {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .battery-bar {
            width: 60px;
            height: 8px;
            background: var(--bg-secondary);
            border-radius: 4px;
            overflow: hidden;
            position: relative;
        }

        .battery-fill {
            height: 100%;
            border-radius: 4px;
            transition: width 0.3s ease;
        }

        .battery-high {
            background: linear-gradient(90deg, var(--success-color), #68d391);
        }

        .battery-medium {
            background: linear-gradient(90deg, var(--warning-color), #fbb040);
        }

        .battery-low {
            background: linear-gradient(90deg, var(--danger-color), #fc8181);
        }

        .navigation {
            margin-top: 3rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            animation: fadeInUp 0.8s ease-out 0.6s both;
        }

        .nav-card {
            background: var(--bg-card);
            padding: 1.5rem;
            border-radius: 16px;
            border: 2px solid transparent;
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .nav-card:hover {
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
            text-decoration: none;
            color: var(--text-primary);
        }

        .nav-icon {
            font-size: 1.5rem;
            color: var(--primary-color);
            width: 40px;
            height: 40px;
            border-radius: 12px;
            background: rgba(102, 126, 234, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .nav-content h3 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .nav-content p {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .header h1 {
                font-size: 2rem;
            }

            th, td {
                padding: 0.75rem 1rem;
                font-size: 0.9rem;
            }

            .table-header {
                padding: 1rem 1.5rem;
            }
        }

        .search-container {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 1.25rem;
            flex-wrap: wrap;
            align-items: center;
        }

        .search-input {
            flex-grow: 1;
            min-width: 200px;
            padding: 0.5rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 5px var(--primary-color);
        }

        .search-button, .sort-button {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            font-weight: 600;
            border-radius: 0.375rem;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        .search-button:hover, .sort-button:hover {
            background: var(--secondary-color);
        }

        .reset-button {
            background: var(--bg-secondary);
            color: var(--text-primary);
            border: 1px solid var(--border-color);
        }

        .reset-button:hover {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .sort-buttons {
            display: flex;
            gap: 0.75rem;
            flex-wrap: wrap;
            font-weight: 600;
            font-size: 0.9rem;
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            user-select: none;
        }

        .sort-buttons > .sort-button {
            background: var(--bg-secondary);
            color: var(--text-primary);
            border: 1px solid transparent;
            padding: 0.4rem 0.9rem;
            border-radius: 0.375rem;
        }

        .sort-buttons > .sort-button.active {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
            cursor: default;
        }

        .sort-buttons > .sort-button:hover:not(.active) {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .add-vehicle-button {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.6rem 1.2rem;
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            font-size: 1rem;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        .add-vehicle-button:hover {
            background-color: var(--secondary-color);
        }

        .add-vehicle-button i {
            font-size: 1.2rem;
        }
        .actions-cell {
            display: flex;
            gap: 0.5rem;
            justify-content: center;
            align-items: center;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            padding: 0.4rem 0.7rem;
            border-radius: 0.5rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1rem;
            color: white;
            user-select: none;
        }

        .btn-edit {
            background: linear-gradient(135deg, #667eea, #9f7aea); /* синьо-фіолетовий градієнт */
        }

        .btn-edit:hover {
            background: linear-gradient(135deg, #5a67d8, #7f5af0);
        }

        .btn-delete {
            background: linear-gradient(135deg, #f471b5, #ed64a6); /* рожево-фіолетовий градієнт */
        }

        .btn-delete:hover {
            background: linear-gradient(135deg, #e53e3e, #c53030); /* яскраво-червоний для ховера */
        }

        .btn i {
            pointer-events: none; /* щоб іконки не блокували кліки */
        }

    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1><i class="fas fa-motorcycle"></i> Транспортні засоби</h1>
        <p>Управління парком електротранспорту ScooterHub</p>
    </div>

    <form action="/vehicles" method="get" class="search-container" style="margin-bottom: 20px;">
        <input type="text" name="search" placeholder="Пошук за моделлю або типом..." value="${search != null ? search : ""}" class="search-input">
        <button type="submit" class="search-button">Шукати</button>
        <a href="/vehicles" class="sort-button reset-button">Скинути пошук</a>
    </form>

    <div class="sort-buttons" style="margin-bottom: 20px;">
        Сортувати:
        <a href="/vehicles?search=${search != null ? search : ""}&sortBy=type_asc" class="sort-button ${"type_asc".equals(sortBy) ? "active" : ""}">Тип ↑</a>
        <a href="/vehicles?search=${search != null ? search : ""}&sortBy=type_desc" class="sort-button ${"type_desc".equals(sortBy) ? "active" : ""}">Тип ↓</a>
        <a href="/vehicles?search=${search != null ? search : ""}&sortBy=model_asc" class="sort-button ${"model_asc".equals(sortBy) ? "active" : ""}">Модель ↑</a>
        <a href="/vehicles?search=${search != null ? search : ""}&sortBy=model_desc" class="sort-button ${"model_desc".equals(sortBy) ? "active" : ""}">Модель ↓</a>
        <a href="/vehicles" class="sort-button ${sortBy == null || sortBy.isEmpty() ? "active" : ""}">Без сортування</a>
        <a href="/add-vehicle" class="add-vehicle-button">
            <i class="fas fa-plus-circle"></i> Додати транспорт
        </a>
    </div>


    <div class="table-container">
        <div class="table-header">
            <div class="table-title">
                <i class="fas fa-list"></i>
                Детальна інформація про транспортні засоби
            </div>
        </div>
        <div class="table-wrapper">
            <table>
                <thead>
                <tr>
                    <th><i class="fas fa-hashtag"></i> ID</th>
                    <th><i class="fas fa-tag"></i> Тип</th>
                    <th><i class="fas fa-cog"></i> Модель</th>
                    <th><i class="fas fa-power-off"></i> Статус</th>
                    <th><i class="fas fa-map-marker-alt"></i> Місцезн.</th>
                    <th><i class="fas fa-battery-half"></i> Батарея</th>
                    <th>Дії</th>
                </tr>
                </thead>
                <tbody>
                @for (Vehicle vehicle : vehicles)
                    <tr>
                        <td>
                            <span class="vehicle-id">#${vehicle.id}</span>
                        </td>
                        <td>
                            <span class="vehicle-type">
                                <i class="fas fa-motorcycle"></i>
                                ${vehicle.type}
                            </span>
                        </td>
                        <td><strong>${vehicle.model}</strong></td>
                        <td>
                            <span class="status-badge
                                 @if(vehicle.available)
                                          status-available
                                 @else
                                          status-unavailable
                                 @endif">
                                <i class="fas
                                   @if(vehicle.available)
                                          fa-check-circle
                                   @else
                                          fa-times-circle
                                   @endif"></i>
                                ${vehicle.available ? "Доступний" : "Недоступний"}
                            </span>
                        </td>
                        <td>
                            <i class="fas fa-map-marker-alt"></i>
                            ${vehicle.currentLocation}
                        </td>
                        <td>
                            <div class="battery-container">
                                <div class="battery-bar">
                                    @if (vehicle.batteryLevel != null)
                                        @if (vehicle.batteryLevel >= 60)
                                            <div class="battery-fill battery-high" style="width: ${vehicle.batteryLevel}%"></div>
                                        @elseif (vehicle.batteryLevel >= 30)
                                            <div class="battery-fill battery-medium" style="width: ${vehicle.batteryLevel}%"></div>
                                        @else
                                            <div class="battery-fill battery-low" style="width: ${vehicle.batteryLevel}%"></div>
                                        @endif
                                    @else
                                        <div class="battery-fill battery-unknown" style="width: 0%"></div>
                                    @endif
                                </div>
                                <span><strong>${vehicle.batteryLevel}%</strong></span>
                            </div>
                        </td>
                        <td class="actions-cell">
                            <a href="${"/edit-vehicle/" + vehicle.id}" class="btn btn-edit" title="Редагувати">

                            <i class="fas fa-edit"></i>
                            </a>
                            <form action="/delete-vehicle/${vehicle.id}" method="post" class="delete-form" onsubmit="return confirm('Ви дійсно хочете видалити цей транспорт?');" style="display:inline;">
                                <button type="submit" class="btn btn-delete" title="Видалити">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                @endfor
                </tbody>
            </table>
        </div>
    </div>

    <div class="navigation">
        <a href="/vehicle-routes" class="nav-card">
            <div class="nav-icon"><i class="fas fa-route"></i></div>
            <div class="nav-content">
                <h3>Транспорт-Маршрут</h3>
                <p>Зв'язок транспорту з маршрутами</p>
            </div>
        </a>

        <a href="/routes" class="nav-card">
            <div class="nav-icon"><i class="fas fa-map"></i></div>
            <div class="nav-content">
                <h3>Маршрути</h3>
                <p>Перегляд всіх доступних маршрутів</p>
            </div>
        </a>
    </div>
</div>


</body>
</html>