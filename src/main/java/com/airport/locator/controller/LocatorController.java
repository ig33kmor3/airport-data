package com.airport.locator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LocatorController {

    @GetMapping("/")
    public String Locations(Model model) {
        return "locations";
    }
}
