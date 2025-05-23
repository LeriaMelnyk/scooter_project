package com.example.scooter;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Getter
@Entity
@Table(name = "routes")
public class Route {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Setter
    @Column(name = "start_point", length = 100, nullable = false)
    public String startPoint;

    @Setter
    @Column(name = "end_point", length = 100, nullable = false)
    public String endPoint;

    @Setter
    @Column(name = "distance_km", precision = 5, scale = 2, nullable = false)
    public BigDecimal distanceKm;

    @Setter
    @Column(name = "difficulty_level", length = 10, nullable = false)
    @Enumerated(EnumType.STRING)
    public DifficultyLevel difficultyLevel;

    @Setter
    @ManyToMany(mappedBy = "routes")
    private Set<Vehicle> vehicles = new HashSet<>();

    public Route() {}

}
