//
//  TSSharepoint.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSSharepoint {
    
    public var agency: TSAgency!
    public var repository: TSRepository!
    
    private static var instance: TSSharepoint?
    
    public required init() {
        
    }
    
    public static func getInstance() -> TSSharepoint {
        
        guard instance != nil else {
            
            instance = TSSharepoint()
            
            instance!.agency = TSAgency()
            instance!.agency!.manager = TSManager()
            instance!.agency!.manager!.apiManager = TSApiManager()
            instance!.agency!.manager!.eventManager = TSEventManager()
            instance!.agency!.manager!.networkManager = TSNetworkManager()
            instance!.agency!.manager!.mediaManager = TSMediaManager()
            instance!.agency!.provider = TSProvider()
            instance!.agency!.provider!.colorProvider = TSColorProvider()
            instance!.agency!.provider!.fontProvider = TSFontProvider()
            instance!.agency!.provider!.imageProvider = TSImageProvider()
            
            instance!.repository = TSRepository()
            instance!.repository!.dataStorage = TSDataStorage()
            instance!.repository!.exchangeFlow = TSExchangeFlow()
            instance!.repository!.persistentStorage = TSPersistentStorage()
            instance!.repository!.stateMachine = TSStateMachine()
            
            instance!.agency!.manager!.apiManager!.injectDependencies()
            instance!.agency!.manager!.networkManager!.injectDependencies()
            
            return instance!
            
        }
        
        return instance!
        
    }
    
    public static func resetSharepoint() {
        instance = nil
        
    }
    
    
}
