package com.example.scooter;
import com.example.scooter.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("roles", User.Role.values());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") @Valid User user,
                               BindingResult result,
                               Model model) {
        if (userRepository.existsByName(user.getName())) {
            result.rejectValue("name", null, "Користувач з таким ім’ям вже існує");
        }

        if (result.hasErrors()) {
            model.addAttribute("roles", User.Role.values());
            model.addAttribute("bindingResult", result);
            return "register";
        }

        // Шифруємо пароль перед збереженням
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);
        System.out.println("Збережений користувач: " + user.getName() + ", пароль: " + user.getPassword());
        System.out.println(result.getAllErrors());

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model, HttpServletRequest request) {
        model.addAttribute("user", new User());
        model.addAttribute("request", request);
        return "login";
    }



}

