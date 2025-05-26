package com.example.scooter.controllers;

import com.example.scooter.data.VehicleRoutes;
import com.example.scooter.repository.VehicleRouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VehicleRouteController {

    @Autowired
    private VehicleRouteRepository vehicleRouteRepository;

    @GetMapping("/vehicle-routes")
    public String showVehicleRoutes(Model model) {
        Iterable<VehicleRoutes> vehicleRoutes = vehicleRouteRepository.findAll();
        model.addAttribute("vehicleRoutes", vehicleRoutes);
        return "vehicle-routes";
    }
}
