//
//  MainSheet-Main.swift
//  TunesSearch
//
//  Created by Can Özcan on 11.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class MainSheet: Sheet<MainLayout> {
        
        public override func onLayoutAppear(layout: MainLayout) {
            
            for button in layout.scope.items {
                button.btn.onClick {
                    for btn in layout.scope.items {
                        btn.activateButton(state: false)
                    }
                    button.activateButton(state: true)
                    self.exchangeFlow.letSelectedEntity(entity: button.title!.firstLowercased.replacingOccurrences(of: " ", with: ""))
                    print(button.title!.lowercased().trimmingCharacters(in: .whitespaces))
                }
                
            }
            
            layout.ti.whileEdit { (ti) in
                
                if self.stateMachine.notGettingSearchList() {
                    self.stateMachine.isGetSearchList(state: true)
                    layout.lv.replaceItems([])
                    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        self.apiManager.getSearchResults(query: ti.text!,entity: self.exchangeFlow.grabSelectedEntity()) { (json, items) in
                            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                                var lvItems = [ListItemView]()
                                for item in items {
                                    var itemFavorite = false
                                    if let dateFav = (self.persistentStorage.recall(key: item.hashID) as? String)?.iso8601 {
                                        if Date().timeIntervalSince(dateFav) >= 60 * 24 * 24 {
                                            self.persistentStorage.remove(key: item.hashID)
                                        } else {
                                            itemFavorite = true
                                        }
                                    }
                                    let lvItem = ListItemView()
                                    lvItem.addAction {
                                        self.exchangeFlow.letSelectedItem(item: item)
                                        self.exchangeFlow.letSelectedListItem(item: lvItem)
                                        self.demonstrator.toDetailSheet()
                                    }
                                    lvItem.loadData(item: item,isFavorite: itemFavorite)
                                    lvItems.append(lvItem)
                                }
                                layout.lv.replaceItems(lvItems)
                                self.stateMachine.isGetSearchList(state: false)
                            }
                        }
                    }
                }
            }
            

            
            
        }
        
    }
    
}
