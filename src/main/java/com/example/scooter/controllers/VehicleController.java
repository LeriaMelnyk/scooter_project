package com.example.scooter.controllers;

import com.example.scooter.data.Vehicle;
import com.example.scooter.data.VehicleType;
import com.example.scooter.repository.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class VehicleController {

    private final VehicleRepository vehicleRepository;

    @Autowired
    public VehicleController(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    @GetMapping("/vehicles")
    public String listVehicles(@RequestParam(required = false) String search,
                               @RequestParam(required = false) String sortBy,Model model) {
        List<Vehicle> vehicles = new ArrayList<>();
        vehicleRepository.findAll().forEach(vehicles::add); // отримуємо всі транспортні засоби

        // Фільтрація за пошуком (тип або модель містять рядок)
        if (search != null && !search.isBlank()) {
            String lowerSearch = search.toLowerCase();
            vehicles = vehicles.stream()
                    .filter(v -> v.getType().name().toLowerCase().contains(lowerSearch)
                            || v.getModel().toLowerCase().contains(lowerSearch))
                    .collect(Collectors.toList());
        }

        // Сортування
        if ("type_asc".equals(sortBy)) {
            vehicles.sort(Comparator.comparing(Vehicle::getType));
        } else if ("type_desc".equals(sortBy)) {
            vehicles.sort(Comparator.comparing(Vehicle::getType).reversed());
        } else if ("model_asc".equals(sortBy)) {
            vehicles.sort(Comparator.comparing(Vehicle::getModel));
        } else if ("model_desc".equals(sortBy)) {
            vehicles.sort(Comparator.comparing(Vehicle::getModel).reversed());
        }

        model.addAttribute("vehicles", vehicles);
        model.addAttribute("search", search);
        model.addAttribute("sortBy", sortBy);

        return "vehicles";
    }

    @GetMapping("/add-vehicle")
    public String showAddForm(Model model) {
        model.addAttribute("vehicle", new Vehicle()); // порожній об'єкт для форми
        model.addAttribute("types", VehicleType.values()); // типи для випадаючого списку
        return "add-vehicle";
    }

    @PostMapping("/add-vehicle")
    public String addVehicle(
            @RequestParam VehicleType type,
            @RequestParam String model,
            @RequestParam(required = false, defaultValue = "false") boolean available,
            @RequestParam String currentLocation,
            @RequestParam(required = false) Integer batteryLevel) {

        Vehicle vehicle = new Vehicle();
        vehicle.setType(type);
        vehicle.setModel(model);
        vehicle.setAvailable(available);
        vehicle.setCurrentLocation(currentLocation);
        vehicle.setBatteryLevel(batteryLevel);

        vehicleRepository.save(vehicle);
        return "redirect:/vehicles";
    }



    @GetMapping("/edit-vehicle/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Vehicle vehicle = vehicleRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid vehicle Id:" + id));
        model.addAttribute("vehicle", vehicle);
        model.addAttribute("types", VehicleType.values()); // для селекта типів
        return "edit-vehicle";  // назва шаблону для редагування
    }


    @PostMapping("/edit-vehicle/{id}")
    public String updateVehicle(
            @PathVariable Long id,
            @RequestParam VehicleType type,
            @RequestParam String model,
            @RequestParam(required = false, defaultValue = "false") boolean available,
            @RequestParam String currentLocation,
            @RequestParam(required = false) Integer batteryLevel) {

        Vehicle vehicle = vehicleRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid vehicle Id:" + id));

        vehicle.setType(type);
        vehicle.setModel(model);
        vehicle.setAvailable(available);
        vehicle.setCurrentLocation(currentLocation);
        vehicle.setBatteryLevel(batteryLevel);

        vehicleRepository.save(vehicle);
        return "redirect:/vehicles";
    }


    @PostMapping("/delete-vehicle/{id}")
    public String deleteVehicle(@PathVariable Long id) {
        if (vehicleRepository.existsById(id)) {
            vehicleRepository.deleteById(id);
        }
        return "redirect:/vehicles";
    }
}

