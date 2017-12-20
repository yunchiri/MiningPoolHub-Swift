//
//  MphWebProvider.swift
//  MiningPoolHub
//
//  Created by Matthew York on 12/18/17.
//  Copyright © 2017 Matthew York. All rights reserved.
//

import Foundation
import ObjectMapper

public enum HttpMethod: String {
    case get = "GET",
    post = "POST",
    put = "PUT",
    delete = "DELETE"
}

public enum MphDomain: String {
    case root = "",
    adzcoin = "adzcoin",
    auroracoinQubit = "auroracoin-qubit",
    bitcoin = "bitcoin",
    bitcoinCash = "bitcoin-cash",
    bitcoinGold = "bitcoin-gold",
    dash = "dash",
    digibyteGroestl = "digibyte-groestl",
    digibyteQubit = "digibyte-qubit",
    digibyteSkein = "digibyte-skein",
    electroneum = "electroneum",
    ethereum = "ethereum",
    ethereumClassic = "ethereum-classic",
    expanse = "expanse",
    feathercoin = "feathercoin",
    gamecredits = "gamecredits",
    geocoin = "geocoin",
    globalboosty = "globalboosty",
    groestlcoin = "groestlcoin",
    litecoin = "litecoin",
    maxcoin = "maxcoin",
    monacoin = "monacoin",
    monero = "monero",
    musicoin = "musicoin",
    myriadcoinGroestl = "myriadcoin-groestl",
    myriadcoinSkein = "myriadcoin-skein",
    myriadcoinYescrypt = "myriadcoin-yescrypt",
    sexcoin = "sexcoin",
    siacoin = "siacoin",
    startcoin = "startcoin",
    vergeScrypt = "verge-scrypt",
    vertcoin = "vertcoin",
    zcash = "zcash",
    zclassic = "zclassic",
    zcoin = "zcoin",
    zencash = "zencash"
}

public class MphWebProvider {

    var operationQueue = OperationQueue()
    let urlSession: URLSession = URLSession(configuration:URLSessionConfiguration.default)
    let baseAddress: String = "miningpoolhub.com/index.php?page=api&"
    let configuration: MphConfiguration
    public var mphDomain: MphDomain = MphDomain.root
    var customDomain: String?
    
    //MARK: - Init
    public init(configuration: MphConfiguration) {
        self.configuration = configuration
    }
    
    //MARK: - Domains
    public func set(domain: MphDomain) {
        self.mphDomain = domain
        customDomain = nil
    }
    public func setCustom(domain: String) {
        customDomain = domain
    }
}

//MARK: - Api
extension MphWebProvider : MphProvider {
    //MARK: Unauthenticated
    
    /**
     Get mining profits statistics
     */
    public func getMiningAndProfitsStatistics(completion: @escaping (MphListResponse<MphCoinProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getminingandprofitsstatistics", completion: completion, error: error)
    }
    
    /**
     Get current auto switching info
     */
    public func getAutoSwitchingAndProfitsStatistics(completion: @escaping (MphListResponse<MphAutoSwitchingProfitStatistics>) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getautoswitchingandprofitsstatistics", completion: completion, error: error)
    }
    
    /**
     Fetch public pool statistics, no authentication required
    */
    public func getPublicPoolStatistics(completion: @escaping (MphPublicPoolResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=public", completion: completion, error: error)
    }
    
    //MARK: Authenticated
    
    /**
     Get all currency's balances
    */
    public func getUserAllBalances(completion: @escaping (MphUserBalancesResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getuserallbalances", completion: completion, error: error)
    }
    
    /**
     Get current block height in blockchain
     */
    public func getBlockCount(completion: @escaping (MphBlockCountResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblockcount", completion: completion, error: error)
    }
    
    /**
     Get last N blocks found as configured in admin panel
    */
    public func getBlocksFound(completion: @escaping (MphBlocksFoundResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblocksfound", completion: completion, error: error)
    }
    
    /**
     Get pool block stats
     */
    public func getBlockStats(completion: @escaping (MphBlockStatsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getblockstats", completion: completion, error: error)
    }
    
    /**
     Get amount of current active workers
     */
    public func getCurrentWorkers(completion: @escaping (MphCurrentWorkersResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getcurrentworkers", completion: completion, error: error)
    }
    
    /**
     Fetch all dashboard related information
     */
    public func getDashboardData(id: String? = nil, completion: @escaping (MphDashboardResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        //Build action
        var action = "action=getdashboarddata"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Get current difficulty in blockchain
     */
    public func getDifficulty(completion: @escaping (MphDifficultyResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getdifficulty", completion: completion, error: error)
    }
    
    /**
     Get estimated time to next block based on pool hashrate (seconds)
     */
    public func getEstimatedTime(completion: @escaping (MphEstimatedTimeResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getestimatedtime", completion: completion, error: error)
    }
    
    /**
     Get current pool hashrate
     */
    public func getPoolHashRate(completion: @escaping (MphPoolHashRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolhashrate", completion: completion, error: error)
    }
    
    /**
     Get the information on pool settings
    */
    public func getPoolInfo(completion: @escaping (MphPoolInfoResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolinfo", completion: completion, error: error)
    }
    
    /**
     Get current pool share rate (shares/s)
     */
    public func getPoolShareRate(completion: @escaping (MphPoolShareRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolsharerate", completion: completion, error: error)
    }
    
    /**
     Fetch overall pool status, only user token is required
    */
    public func getPoolStatus(completion: @escaping (MphPoolStatusResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=getpoolstatus", completion: completion, error: error)
    }
    
    /**
     Get time since last block found (seconds)
    */
    public func getTimeSinceLastBlock(completion: @escaping (MphTimeSinceLastBlockResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=gettimesincelastblock", completion: completion, error: error)
    }
    
    /**
     Fetch top contributors data
    */
    public func getTopContributors(completion: @escaping (MphTopContributorsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        return makeJsonRequest(method: .get, action: "action=gettopcontributors", completion: completion, error: error)
    }
    
    /**
     Fetch a users balance
    */
    public func getUserBalance(id: String? = nil, completion: @escaping (MphUserBalanceResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserbalance"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Fetch a users hash rate
     */
    public func getUserHashRate(id: String?, completion: @escaping (MphUserHashRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserhashrate"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }

    /**
     Fetch a users share rate
    */
    public func getUserShareRate(id: String?, completion: @escaping (MphUserShareRateResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getusersharerate"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Fetch a users overall status
     */
    public func getUserStatus(id: String?, completion: @escaping (MphUserStatusResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserstatus"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Get a users transactions
     */
    public func getUserTransactions(id: String?, completion: @escaping (MphUserTransactionsResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getusertransactions"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
    
    /**
     Fetch a users worker status
     */
    public func getUserWorkers(id: String?, completion: @escaping (MphUserWorkersResponse) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        var action = "action=getuserworkers"
        if let id = id { action += "&id=\(id)"}
        
        return makeJsonRequest(method: .get, action: action, completion: completion, error: error)
    }
}

// Url Request
extension MphWebProvider {
    fileprivate func makeJsonRequest<RT:Mappable>(method: HttpMethod, action: String, headers: [String:String] = [:], completion:@escaping (RT) -> (), error: @escaping (Error) -> ()) -> MphProviderOperationProtocol {
        
        //Build Url
        let url = requestUrl(for: action)
        var request = URLRequest(url: URL(string:url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20.0)
        
        //Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for header in headers { request.addValue(header.value, forHTTPHeaderField: header.key) }
        
        //Set body
        request.httpBody = nil
        request.httpMethod = method.rawValue
        
        //Make request
        let task = urlSession.dataTask(with: request) {(data, response, taskError)  -> Void in
            
            //Clean the response to be traditional http response
            let httpResponse = self.cleanResponse(urlResponse: response)
            if !httpResponse.wasSuccessful { DispatchQueue.main.async { error(WebProviderError(error: taskError)) } }
            guard let responseString = String(data: data!, encoding: String.Encoding.utf8) else { error(WebProviderError(error: nil)); return }
            
            //Parse and return
            guard let mappedObject = Mapper<RT>().map(JSONString: responseString) else {
                let parseError = MapError(key: "", currentValue: "", reason: "Error parsing response object: \(RT.self)")
                DispatchQueue.main.async { error(parseError) }
                return
            }
            DispatchQueue.main.async { completion(mappedObject) }
        }
        task.resume()
        
        return task
    }
    
    fileprivate func makeRequest() -> MphProviderOperationProtocol {
        return URLSessionTask()
    }
    
    fileprivate func requestUrl(for action: String) -> String {
        let domain = (customDomain ?? mphDomain.rawValue)
        let domainPrefix = domain != "" ? domain+"." : domain
        return "https://\(domainPrefix)\(baseAddress)\(action)"+"&api_key="+configuration.apiKey
    }
}

extension MphWebProvider {
    fileprivate func cleanResponse(urlResponse: URLResponse?) -> HTTPURLResponse {
        if urlResponse != nil {
            return (urlResponse! as! HTTPURLResponse)
        }
        else {
            let httpResponse = HTTPURLResponse(url: URL(string:"com.webprovider")!, statusCode: 500, httpVersion: "", headerFields: [:])
            return httpResponse!
        }
    }
}

extension HTTPURLResponse {
    var wasSuccessful: Bool { return (self.statusCode >= 200 && self.statusCode < 300) }
}

public class WebProviderError: Error {
    init() { }
    init(error: Error?) { }
}
