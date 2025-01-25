//
//
// PokeDex
// Creature.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import Foundation

// Result Struct for name and url information in API
struct Creature: Codable, Hashable {
    var name: String
    var url: String  // url for detail on Pokemon
}
