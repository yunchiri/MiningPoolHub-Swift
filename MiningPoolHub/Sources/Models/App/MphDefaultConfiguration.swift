//
//  MphDefaultConfiguration.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation

public class MphDefaultConfiguration : MphConfiguration {
    public var apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}
