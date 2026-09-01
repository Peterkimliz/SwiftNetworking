//
//  ApiErrors.swift
//  SwiftNetworking
//
//  Created by Apple on 01/09/2026.
//

import SwiftUI

enum ApiErrors:Error{
    case invalidUrl
    case invalidHttpResponse
    case invalidData
    case unknownError(desc:String)
    
    var description:String{
        switch self {
        case .invalidUrl:
            return "invalid url"
        case .invalidHttpResponse:
             return "invalid http response"
        case .invalidData:
             return "invalid data"
        case .unknownError(let desc):
            return desc
            }
    }
    
    
}


