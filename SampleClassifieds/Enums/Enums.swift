//
//  Enums.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import Foundation

// swift result type
enum ResultType<T> {
    case Success(T)
    case Failure(e: Error?)
}

// Error for unknown case
enum JSONDecodingError: Error, LocalizedError {
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString("Unknown Error occured", comment: "")
        }
    }
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    
    case products = "products"
    case loading = "Please Wait..."
    case empty = ""
    case noConnection = "No Connection"
    case internetErrorTitleText = "Error"
    case internetErrorMessageText = "Please make sure you are connected to internet. Close the app and open again after restoring internet"
    case name = "Name: "
    case price = "Price: "
    case productId = "Product-Id: \n"
    case loadingProducts = "Loading products"
    case networkNotAvailable = "Network Not Available"
}

