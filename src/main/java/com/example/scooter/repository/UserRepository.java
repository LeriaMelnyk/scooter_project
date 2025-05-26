package com.example.scooter.repository;

import com.example.scooter.data.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface UserRepository extends CrudRepository<User, Long> {
        Optional<User> findByName(String name);

        boolean existsByName(String name);
}

