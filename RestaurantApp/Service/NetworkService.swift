//
//  NetworkService.swift
//  RestaurantApp
//
//  Created by Baiaman Gapparov on 8/21/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import Foundation
import Moya

private let apiKey = ""

enum YelpService {
    enum BusinessesProvider: TargetType {
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .search:
                return "/search"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 1], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
        
        case search(lat: Double, long: Double)
    }
}
