package com.example.scooter.repository;


import com.example.scooter.data.VehicleRoutes;
import com.example.scooter.data.VehicleRouteId;
import org.springframework.data.repository.CrudRepository;

public interface VehicleRouteRepository extends CrudRepository<VehicleRoutes, VehicleRouteId> {
}
