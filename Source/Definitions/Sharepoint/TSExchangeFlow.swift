//
//  TSExchangeFlow.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSExchangeFlow {
    
    public required init() {
        
    }
    
    private var lastSelectedEntity: String = "all"
    public func letSelectedEntity(entity: String) {
        self.lastSelectedEntity = entity
    }
    public func grabSelectedEntity() -> String {
        return self.lastSelectedEntity
    }
    
    private var lastSelectedItem: Item?
    public func letSelectedItem(item: Item) {
        self.lastSelectedItem = item
    }
    public func grabSelectedItem() -> Item? {
        return self.lastSelectedItem
    }
    
    private var lastSelectedListItem: Main.ListItemView?
    public func letSelectedListItem(item: Main.ListItemView) {
        self.lastSelectedListItem = item
    }
    public func grabSelectedListItem() -> Main.ListItemView? {
        return self.lastSelectedListItem
    }
    
}
