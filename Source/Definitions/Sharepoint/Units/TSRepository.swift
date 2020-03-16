//
//  TSRepository.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSRepository {
    
    public var exchangeFlow: TSExchangeFlow!
    public var persistentStorage: TSPersistentStorage!
    public var stateMachine: TSStateMachine!
    public var dataStorage: TSDataStorage!
    
    public required init() {
        
    }
    
}
