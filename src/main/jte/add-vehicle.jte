@import com.example.scooter.data.VehicleType
@param com.example.scooter.data.Vehicle vehicle
@param com.example.scooter.data.VehicleType[] types


<div class="container">
    <h2>Додати новий транспорт</h2>
    <form action="/add-vehicle" method="post" class="add-vehicle-form">

        <label for="type">Тип:</label>
        <select name="type" id="type" required>
            <option value="" disabled selected>Оберіть тип транспортного засобу</option>
            @for (VehicleType type : types)
                <option value="${type}">${type}</option>
            @endfor
        </select>

        <label for="model">Модель:</label>
        <input type="text" id="model" name="model" required>

        <label>
            <input type="checkbox" name="available" value="true">
            Доступний
        </label>

        <label for="currentLocation">Місцезнаходження:</label>
        <input type="text" id="currentLocation" name="currentLocation" required>

        <label for="batteryLevel">Рівень батареї (%):</label>
        <input type="number" id="batteryLevel" name="batteryLevel" min="0" max="100">

        <button type="submit" class="btn">Додати транспорт</button>
    </form>
</div>
<style>
:root {
--primary-color: #667eea;    /* синій-фіолетовий */
--secondary-color: #f471b5;  /* рожево-фіолетовий */
--bg-secondary: #f9f7fd;     /* світло-фіолетовий фон */
--border-color: #d3c9f4;     /* світлий фіолетовий */
--text-primary: #3b3054;     /* темний фіолетовий */
}

.container {
max-width: 600px;
margin: 2rem auto;
padding: 1.5rem 2rem;
background: var(--bg-secondary);
border-radius: 8px;
box-shadow: 0 4px 15px rgba(244, 113, 181, 0.3);
font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

h2 {
color: var(--primary-color);
margin-bottom: 1.5rem;
font-weight: 700;
text-align: center;
}

.add-vehicle-form {
display: flex;
flex-direction: column;
gap: 1.25rem;
}

.add-vehicle-form label {
font-weight: 600;
color: var(--text-primary);
margin-bottom: 0.3rem;
display: block;
}

.add-vehicle-form input[type="text"],
.add-vehicle-form input[type="number"],
.add-vehicle-form select {
width: 100%;
padding: 0.5rem 0.75rem;
border: 2px solid var(--border-color);
border-radius: 0.5rem;
font-size: 1rem;
color: var(--text-primary);
background: white;
transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.add-vehicle-form input[type="text"]:focus,
.add-vehicle-form input[type="number"]:focus,
.add-vehicle-form select:focus {
outline: none;
border-color: var(--primary-color);
box-shadow: 0 0 8px var(--primary-color);
}

.add-vehicle-form input[type="checkbox"] {
margin-right: 0.5rem;
transform: scale(1.2);
cursor: pointer;
vertical-align: middle;
}

.add-vehicle-form label > input[type="checkbox"] {
vertical-align: middle;
}

.btn {
background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
color: white;
border: none;
padding: 0.85rem 1.5rem;
font-weight: 700;
font-size: 1.15rem;
border-radius: 0.75rem;
cursor: pointer;
transition: background 0.4s ease;
user-select: none;
align-self: flex-start;
box-shadow: 0 4px 15px rgba(102, 126, 234, 0.5);
}

.btn:hover {
background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
box-shadow: 0 6px 20px rgba(244, 113, 181, 0.7);
}
</style>