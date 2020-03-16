//
//  DetailSheet-Main.swift
//  TunesSearch
//
//  Created by Can Özcan on 11.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class DetailSheet: Sheet<DetailLayout> {
        
        public override func onLayoutReady(layout: DetailLayout) {
            
            layout.iv_back.onTap {
                self.demonstrator.goBack()
            }
            
            
            layout.btn_favorite.onClick {
                let listItem = self.exchangeFlow.grabSelectedListItem()!
                layout.loadData(item: self.exchangeFlow.grabSelectedItem()!, isFavorite: !self.exchangeFlow.grabSelectedListItem()!.isFavorite)
                if !listItem.isFavorite {
                    self.persistentStorage.store(key: self.exchangeFlow.grabSelectedItem()!.hashID, value: Date().iso8601)
                } else {
                    self.persistentStorage.remove(key: self.exchangeFlow.grabSelectedItem()!.hashID)
                }
                listItem.isFavorite = !listItem.isFavorite
                listItem.iv_favorite.alpha = listItem.isFavorite ? 1 : 0
            }
            
        }
        
        public override func onLayoutAppear(layout: DetailLayout) {
            layout.loadData(item: exchangeFlow.grabSelectedItem()!, isFavorite: self.exchangeFlow.grabSelectedListItem()!.isFavorite)
        }
        
    }
    
}
