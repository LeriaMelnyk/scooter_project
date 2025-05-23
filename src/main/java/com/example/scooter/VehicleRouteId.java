package com.example.scooter;

import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class VehicleRouteId implements Serializable {
    private int vehicleId;
    private int routeId;

    // конструктори, equals, hashCode
    public VehicleRouteId() {}

    public VehicleRouteId(int vehicleId, int routeId) {
        this.vehicleId = vehicleId;
        this.routeId = routeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof VehicleRouteId that)) return false;
        return vehicleId == that.vehicleId && routeId == that.routeId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(vehicleId, routeId);
    }

    // геттери і сеттери
}

