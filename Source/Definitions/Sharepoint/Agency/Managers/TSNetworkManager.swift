//
//  TSNetworkManager.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSNetworkManager: NSObject {
    
    /*
    -
    -
    // MARK: Sharepoint
    -
    -
    */
    
    private var sharepoint: TSSharepoint!
    
    private var agency: TSAgency!
    private var repository: TSRepository!
    
    private var manager: TSManager!
    
    private var eventManager: TSEventManager!
    private var networkManager: TSNetworkManager!
    
    private var dataStorage: TSDataStorage!
    private var persistentStorage: TSPersistentStorage!
    private var exchangeFlow: TSExchangeFlow!
    private var stateMachine: TSStateMachine!
    
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
        stateMachine = repository.stateMachine
        
    }
}
