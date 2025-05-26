@import com.example.scooter.data.User
@param User user
@param User.Role[] roles
@param org.springframework.validation.BindingResult bindingResult = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Реєстрація - Scooter App</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .register-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 450px;
            position: relative;
            overflow: hidden;
        }

        .register-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #667eea, #764ba2);
        }

        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .register-header h1 {
            color: #333;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .register-header p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-control.error {
            border-color: #e74c3c;
            background-color: #fdf2f2;
        }

        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .error-message::before {
            content: '⚠';
            font-size: 14px;
        }

        .btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn:active {
            transform: translateY(0);
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #e1e5e9;
        }

        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .role-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .role-option {
            position: relative;
        }

        .role-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        .role-label {
            display: block;
            padding: 12px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 14px;
            font-weight: 500;
        }

        .role-option input[type="radio"]:checked + .role-label {
            border-color: #667eea;
            background-color: #f0f3ff;
            color: #667eea;
        }

        .role-label:hover {
            border-color: #667eea;
            background-color: #f8f9ff;
        }

        @media (max-width: 480px) {
            .register-container {
                padding: 30px 20px;
            }

            .role-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="register-header">
        <h1>Реєстрація</h1>
        <p>Створіть свій обліковий запис</p>
    </div>

    <form action="/register" method="post">
        <div class="form-group">
            <label for="name">Ім'я користувача</label>
            <input type="text"
                   id="name"
                   name="name"
                   class="form-control @if(bindingResult != null && bindingResult.hasFieldErrors("name")) error @endif"
                   value="@if(user.name != null)${user.name}@endif"
                   required>
            @if(bindingResult != null && bindingResult.hasFieldErrors("name"))
                <div class="error-message">
                    ${bindingResult.getFieldError("name").getDefaultMessage()}
                </div>
            @endif
        </div>

        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password"
                   id="password"
                   name="password"
                   class="form-control ${bindingResult != null && bindingResult.hasFieldErrors("password") ? "error" : ""}"
                   required>
            @if(bindingResult != null && bindingResult.hasFieldErrors("password"))
                <div class="error-message">
                    ${bindingResult.getFieldError("password").getDefaultMessage()}
                </div>
            @endif
        </div>


        <div class="form-group">
            <label>Роль</label>
            <div class="role-grid">
                @for(User.Role role : roles)
                    <div class="role-option">
                        @if(user.role != null && user.role.equals(role))
                            <input type="radio"
                                   id="role_${role}"
                                   name="role"
                                   value="${role}"
                                   checked>
                        @else
                            <input type="radio"
                                   id="role_${role}"
                                   name="role"
                                   value="${role}">
                        @endif

                        <label for="role_${role}" class="role-label">
                            @if(role.name().equals("User"))
                                👤 Користувач
                            @elseif(role.name().equals("Administrator"))
                                👑 Адміністратор
                            @else
                                ${role}
                            @endif
                        </label>
                    </div>
                @endfor
            </div>

            @if(bindingResult != null && bindingResult.hasFieldErrors("role"))
                <div class="error-message">
                    ${bindingResult.getFieldError("role").getDefaultMessage()}
                </div>
            @endif
        </div>



        <button type="submit" class="btn">
            Зареєструватися
        </button>
    </form>

    <div class="login-link">
        Вже маєте обліковий запис? <a href="/login">Увійти</a>
    </div>
</div>
</body>
</html>