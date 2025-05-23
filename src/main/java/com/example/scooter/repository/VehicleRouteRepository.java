package com.example.scooter.repository;


import com.example.scooter.VehicleRoutes;
import com.example.scooter.VehicleRouteId;
import org.springframework.data.repository.CrudRepository;

public interface VehicleRouteRepository extends CrudRepository<VehicleRoutes, VehicleRouteId> {
}
