//
//  ConfigManager.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import Foundation

public class ConfigManager {
    
    private let config: [String: Any]
    
    public init(configName: String) {
        guard let path = Bundle.main.path(forResource: configName , ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            fatalError("Config.plist not found or invalid format")
        }
        self.config = plist
    }
    
    // MARK: - Req Config Props
    
    var baseURL: String {
        guard let baseURL = config["BaseURL"] as? String else {
            fatalError("BaseURL not found in ReqConfig.plist")
        }
        return baseURL
    }
    
    var apiVersion: String {
        guard let version = config["APIVersion"] as? String else {
            fatalError("APIVersion not found in ReqConfig.plist")
        }
        return version
    }
    
    private var endpoints: [String: String] {
        guard let endpoints = config["Endpoints"] as? [String: String] else {
            fatalError("Endpoints not found in ReqConfig.plist")
        }
        return endpoints
    }
    
    func itemListURL() -> URL {
        guard let endpoint = endpoints["ImageList"],
              let url = URL(string: baseURL + endpoint) else {
            fatalError("Invalid ImageList URL configuration")
        }
        return url
    }
    
}
