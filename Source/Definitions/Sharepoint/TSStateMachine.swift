//
//  TSStateMachine.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSStateMachine {
    
    public required init() {
        
    }
    
    private var getSearchList: Bool = false
    public func isGetSearchList(state: Bool) {
        self.getSearchList = state
    }
    public func gettingSearchList() -> Bool {
        return self.getSearchList
    }
    public func notGettingSearchList() -> Bool {
        return !self.getSearchList
    }
    
}
