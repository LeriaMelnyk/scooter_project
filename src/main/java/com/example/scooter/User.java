package com.example.scooter;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Getter
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Setter
    @Column(length = 10, nullable = false)
    public String name;

    @Setter
    @Column(length = 100, nullable = false)
    private String password;

    @Setter
    @Enumerated(EnumType.STRING)
    @Column(length = 10, nullable = false)
    public Role role;

    public User() {}

    public enum Role {
        Administrator,
        User
    }
}
