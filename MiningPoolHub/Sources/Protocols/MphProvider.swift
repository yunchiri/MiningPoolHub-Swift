//
//  MphProviderProtocol.swift
//  MiningPoolHubDemo
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation

public protocol MphProvider {
    //No Api Key Required
    func getMiningAndProfitsStatistics(completion: @escaping (MphListResponse<MphCoinProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getAutoSwitchingAndProfitsStatistics(completion: @escaping (MphListResponse<MphAutoSwitchingProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    
    //Api Key Required
    func getUserAllBalances(completion: @escaping (MphUserBalancesResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getBlockCount(completion: @escaping (MphBlockCountResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getBlocksFound(completion: @escaping (MphBlocksFoundResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getBlockStats(completion: @escaping (MphBlockStatsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getCurrentWorkers(completion: @escaping (MphCurrentWorkersResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getDashboardData(id: String?, completion: @escaping (MphDashboardResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getDifficulty(completion: @escaping (MphDifficultyResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getEstimatedTime(completion: @escaping (MphEstimatedTimeResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getPoolHashRate(completion: @escaping (MphPoolHashRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getPoolInfo(completion: @escaping (MphPoolInfoResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getPoolShareRate(completion: @escaping (MphPoolShareRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
    func getPoolStatus(completion: @escaping (MphPoolStatusResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol
}


