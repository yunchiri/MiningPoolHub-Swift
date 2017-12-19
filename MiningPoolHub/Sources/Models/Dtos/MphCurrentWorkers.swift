//
//  MphCurrentWorkers.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/19/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public class MphCurrentWorkers : MphVersionRuntimeResponse {
    public var data: Int = 0
    
    override init() { super.init() }
    
    // Mappable
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["data"]
    }
}
