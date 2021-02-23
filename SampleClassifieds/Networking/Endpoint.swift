//
//  Endpoint.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import Foundation

/* Endpoint
 This class houses all endpoint logic
 */

enum Endpoint: String {
    typealias RawValue = String
    
    //products
    case getProducts = "dynamodb-writer"
}
