@import com.example.scooter.data.VehicleRoutes
@param Iterable<VehicleRoutes> vehicleRoutes



<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Зв'язок Транспорт-Маршрут | ScooterHub</title>
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
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            position: relative;
            overflow-x: auto;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background:
                    radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                    radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                    radial-gradient(circle at 40% 40%, rgba(120, 219, 255, 0.2) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            position: relative;
            z-index: 1;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
            color: white;
            animation: fadeInDown 0.8s ease-out;
        }

        .header h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }

        .header-icon {
            background: rgba(255, 255, 255, 0.2);
            padding: 1rem;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .header p {
            font-size: 1.2rem;
            opacity: 0.9;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .main-content {
            background: var(--bg-card);
            border-radius: 24px;
            box-shadow: var(--shadow-xl);
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .content-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(240, 147, 251, 0.1));
            padding: 2rem;
            border-bottom: 1px solid var(--border-color);
        }

        .content-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 0.5rem;
        }

        .content-subtitle {
            color: var(--text-secondary);
            font-size: 1.1rem;
        }

        .table-container {
            overflow-x: auto;
            max-height: 70vh;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 1.5rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }

        th {
            background: linear-gradient(135deg, var(--bg-secondary), rgba(102, 126, 234, 0.05));
            font-weight: 600;
            color: var(--text-primary);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
            position: sticky;
            top: 0;
            z-index: 10;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }

        tbody tr {
            transition: all 0.3s ease;
            position: relative;
        }

        tbody tr:hover {
            background: linear-gradient(90deg,
            rgba(102, 126, 234, 0.05),
            rgba(240, 147, 251, 0.05),
            rgba(102, 126, 234, 0.05)
            );
            transform: translateX(4px);
        }

        tbody tr:hover::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: linear-gradient(180deg, var(--primary-color), var(--accent-color));
            border-radius: 0 2px 2px 0;
        }

        .vehicle-id {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 16px;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
        }

        .vehicle-id::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(45deg);
            transition: all 0.6s ease;
        }

        .vehicle-id:hover::before {
            animation: shine 0.6s ease-in-out;
        }

        .vehicle-model {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .vehicle-icon {
            width: 40px;
            height: 40px;
            background: rgba(102, 126, 234, 0.1);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
        }

        .route-id {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--success-color), #68d391);
            color: white;
            border-radius: 12px;
            font-weight: 600;
            box-shadow: var(--shadow-sm);
        }

        .location-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            background: var(--bg-secondary);
            border-radius: 12px;
            margin: 0.25rem 0;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .location-item:hover {
            background: rgba(102, 126, 234, 0.1);
            transform: translateX(2px);
        }

        .location-icon {
            width: 32px;
            height: 32px;
            background: var(--bg-card);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            box-shadow: var(--shadow-sm);
        }

        .start-point {
            border-left: 4px solid var(--success-color);
        }

        .end-point {
            border-left: 4px solid var(--danger-color);
        }

        .route-arrow {
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-secondary);
            font-size: 1.2rem;
            margin: 0.5rem 0;
        }

        .navigation {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            z-index: 100;
        }

        .nav-btn {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            font-size: 1.5rem;
            cursor: pointer;
            box-shadow: var(--shadow-lg);
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.2);
        }

        .nav-btn:hover {
            transform: translateY(-2px) scale(1.05);
            box-shadow: var(--shadow-xl);
        }

        .back-to-top {
            position: fixed;
            bottom: 2rem;
            left: 2rem;
            background: rgba(255, 255, 255, 0.9);
            color: var(--primary-color);
            border: none;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: var(--shadow-md);
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            opacity: 0;
            transform: translateY(20px);
        }

        .back-to-top.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .back-to-top:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .stats-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
            animation: fadeInUp 0.8s ease-out 0.4s both;
        }

        .stat-item {
            background: rgba(255, 255, 255, 0.95);
            padding: 1.5rem;
            border-radius: 16px;
            text-align: center;
            box-shadow: var(--shadow-md);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
        }

        .stat-item:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: var(--text-secondary);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .header h1 {
                font-size: 2.5rem;
                flex-direction: column;
                gap: 0.5rem;
            }

            th, td {
                padding: 1rem 0.75rem;
                font-size: 0.9rem;
            }

            .content-header {
                padding: 1.5rem;
            }

            .vehicle-id {
                width: 50px;
                height: 50px;
                font-size: 1rem;
            }

            .route-id {
                width: 40px;
                height: 40px;
                font-size: 0.9rem;
            }

            .location-item {
                padding: 0.5rem 0.75rem;
                font-size: 0.9rem;
            }

            .navigation {
                bottom: 1rem;
                right: 1rem;
            }

            .back-to-top {
                bottom: 1rem;
                left: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>
            <div class="header-icon">
                <i class="fas fa-route"></i>
            </div>
            Зв'язок Транспорт — Маршрут
        </h1>
        <p>Інтелектуальне управління розподілом транспорту по маршрутах</p>
    </div>


    <div class="main-content">
        <div class="content-header">
            <div class="content-title">
                <i class="fas fa-project-diagram"></i>
                Активні зв'язки транспорт-маршрут
            </div>
            <div class="content-subtitle">
                Детальна інформація про розподіл транспортних засобів по маршрутах
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th><i class="fas fa-motorcycle"></i> Vehicle ID</th>
                    <th><i class="fas fa-cog"></i> Транспортний засіб</th>
                    <th><i class="fas fa-map-signs"></i> Route ID</th>
                    <th><i class="fas fa-route"></i> Маршрут</th>
                </tr>
                </thead>
                <tbody>
                @for (VehicleRoutes vr : vehicleRoutes)
                    <tr>
                        <td>
                            <div class="vehicle-id">${vr.vehicle.id}</div>
                        </td>
                        <td>
                            <div class="vehicle-model">
                                <div class="vehicle-icon">
                                    <i class="fas fa-motorcycle"></i>
                                </div>
                                ${vr.vehicle.model}
                            </div>
                        </td>
                        <td>
                            <div class="route-id">${vr.route.id}</div>
                        </td>
                        <td>
                            <div class="location-item start-point">
                                <div class="location-icon">
                                    <i class="fas fa-play"></i>
                                </div>
                                <span><strong>Початок:</strong> ${vr.route.startPoint}</span>
                            </div>
                            <div class="route-arrow">
                                <i class="fas fa-arrow-down"></i>
                            </div>
                            <div class="location-item end-point">
                                <div class="location-icon">
                                    <i class="fas fa-stop"></i>
                                </div>
                                <span><strong>Кінець:</strong> ${vr.route.endPoint}</span>
                            </div>
                        </td>
                    </tr>
                @endfor
                </tbody>
            </table>
        </div>
    </div>
</div>

<button class="back-to-top" id="backToTop">
    <i class="fas fa-chevron-up"></i>
</button>

<div class="navigation">
    <button class="nav-btn" onclick="history.back()" title="Назад">
        <i class="fas fa-arrow-left"></i>
    </button>
</div>


</body>
</html>