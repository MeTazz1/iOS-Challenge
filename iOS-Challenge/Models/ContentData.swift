//
//  ContentData.swift
//  iOS-Challenge
//
//  Created by Christophe Dlc on 2/26/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

// Resource
// https://github.com/Alamofire/Alamofire

// Struct ContentData - Identifiable
// used to be generated from a JSON object to a instance of ContentData
struct ContentData : Identifiable {
    
    // MARK: - Variables
    // Required property from the Identifiable protocol
    var id = UUID()
    
    // Optional properties from JSON content
    var cId: String?
    var type: ContentType?
    var date: String?
    var data: String?
    
    public enum ContentType: String, CaseIterable, Codable, Hashable {
        case text = "text"
        case image = "image"
        case other = "other"
    }
}


