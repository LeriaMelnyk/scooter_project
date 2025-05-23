package com.example.scooter;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Entity
@Table(name = "vehicles")
public class Vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Setter
    @Enumerated(EnumType.STRING)
    @Column(length = 10, nullable = false)
    public VehicleType type;

    @Setter
    @Column(length = 100, nullable = false)
    public String model;

    @Setter
    @Column(nullable = false)
    public boolean available = true;

    @Setter
    @Column(name = "current_location")
    public String currentLocation;

    @Setter
    @Column(name = "battery_level")
    public Integer batteryLevel;


    @Setter
    @ManyToMany
    @JoinTable(
            name = "vehicle_route",
            joinColumns = @JoinColumn(name = "vehicle_id"),
            inverseJoinColumns = @JoinColumn(name = "route_id")
    )
    private Set<Route> routes = new HashSet<>();

    public Vehicle() {}


}
