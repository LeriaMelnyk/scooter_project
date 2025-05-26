package com.example.scooter.data;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "vehicle_route")
public class VehicleRoutes {

    @EmbeddedId
    private VehicleRouteId id;

    // геттери та сеттери
    @Setter
    @Getter
    @ManyToOne
    @MapsId("vehicleId")
    @JoinColumn(name = "vehicle_id")
    public Vehicle vehicle;

    @Setter
    @Getter
    @ManyToOne
    @MapsId("routeId")
    @JoinColumn(name = "route_id")
    public Route route;

}
