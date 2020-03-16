//
//  TSApiManager.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSApiManager {
    
    public required init() {
        
    }
    
    private var sharepoint: TSSharepoint!
    
    private var agency: TSAgency!
    private var repository: TSRepository!
    
    private var manager: TSManager!
    
    private var eventManager: TSEventManager!
    private var networkManager: TSNetworkManager!
    
    private var dataStorage: TSDataStorage!
    private var persistentStorage: TSPersistentStorage!
    private var exchangeFlow: TSExchangeFlow!
    
    public func injectDependencies() {

        sharepoint = TSSharepoint.getInstance()
        agency = sharepoint.agency
        repository = sharepoint.repository
        manager =  agency.manager
        eventManager = manager.eventManager!
        networkManager = manager.networkManager!
        
        dataStorage = repository.dataStorage
        persistentStorage = repository.persistentStorage
        exchangeFlow = repository.exchangeFlow
        
    }
    
    private var BASE_URL = "https://itunes.apple.com/"
    
    public func getSearchResults(query:String, entity:String, completion: @escaping ActionWith<([String:Any],[Item])>) {
        
        let semaphore = DispatchSemaphore(value: 0)

        var url = "\(BASE_URL)search?term=\(query)&media=\(entity)"
        var request = URLRequest(url: URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let decoder = JSONDecoder()
                let jsonData = try JSONSerialization.data(withJSONObject:json["results"])
                var items = try decoder.decode([Item].self, from: jsonData)
                // MARK: Sort by Name
                items = items.sorted(by: { $0.name < $1.name })
                completion((json,items))
            } catch(let err) {
                print(err)
            }
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
    }
    

}
