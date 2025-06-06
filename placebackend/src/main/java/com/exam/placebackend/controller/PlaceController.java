package com.exam.placebackend.controller;


import com.exam.placebackend.model.Place;
import com.exam.placebackend.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/places")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @GetMapping("/all")
    public List<Place> getAllPlace() {
        return placeService.getAllPlaces();
    }
}