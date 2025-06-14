@import com.example.scooter.data.VehicleType
@param com.example.scooter.data.Vehicle vehicle
@param com.example.scooter.data.VehicleType[] types

<div class="container">
    <h2>Редагувати транспорт</h2>
    <form action="/edit-vehicle/${vehicle.id}" method="post" class="edit-vehicle-form">

        <label for="type">Тип:</label>
        <select name="type" id="type" required>
            <option value="" disabled>Оберіть тип транспортного засобу</option>
            @for (VehicleType type : types)
                <option value="${type}" selected="${type == vehicle.type}">${type}</option>
            @endfor
        </select>

        <label for="model">Модель:</label>
        <input type="text" id="model" name="model" value="${vehicle.model}" required>

        <label>
            <input type="checkbox" name="available" value="true" checked="${vehicle.available}">

            Доступний
        </label>

        <label for="currentLocation">Місцезнаходження:</label>
        <input type="text" id="currentLocation" name="currentLocation" value="${vehicle.currentLocation}" required>

        <label for="batteryLevel">Рівень батареї (%):</label>
        @if (vehicle.batteryLevel != null)
            <input type="number" id="batteryLevel" name="batteryLevel" min="0" max="100"
                   value="${vehicle.batteryLevel}">
        @else
            <input type="number" id="batteryLevel" name="batteryLevel" min="0" max="100">
        @endif

        <button type="submit" class="btn btn-primary">Зберегти зміни</button>
    </form>
</div>

<style>
    .container {
        max-width: 600px;
        margin: 30px auto;
        padding: 24px;
        background-color: #f9f9f9;
        border-radius: 12px;
        box-shadow: 0 0 16px rgba(0, 0, 0, 0.1);
        font-family: "Segoe UI", sans-serif;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 24px;
    }

    .edit-vehicle-form {
        display: flex;
        flex-direction: column;
        gap: 18px;
    }

    .edit-vehicle-form label {
        font-weight: 500;
        color: #444;
    }

    .edit-vehicle-form input[type="text"],
    .edit-vehicle-form input[type="number"],
    .edit-vehicle-form select {
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        transition: border-color 0.2s ease;
    }

    .edit-vehicle-form input:focus,
    .edit-vehicle-form select:focus {
        border-color: #007bff;
        outline: none;
    }

    .edit-vehicle-form input[type="checkbox"] {
        margin-right: 8px;
        transform: scale(1.2);
    }

    .edit-vehicle-form .btn-primary {
        background-color: #007bff;
        color: white;
        padding: 12px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .edit-vehicle-form .btn-primary:hover {
        background-color: #0056b3;
    }

</style>