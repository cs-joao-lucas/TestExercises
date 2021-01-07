//
//  Photo.swift
//  TestsDoublesSample
//
//  Created by Matheus de Vasconcelos on 03/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Foundation

struct Photo: Codable {
    var urls: ImageURL
}

struct ImageURL: Codable {
    var small: String
}
