//
//  TSManager.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSManager {
    
    public var apiManager: TSApiManager?
    public var eventManager: TSEventManager?
    public var networkManager: TSNetworkManager?
    public var mediaManager: TSMediaManager?
    
    public required init() {
        
    }
    
}
