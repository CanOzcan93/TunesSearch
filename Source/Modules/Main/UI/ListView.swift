//
//  ListView.swift
//  TunesSearch
//
//  Created by Can Özcan on 13.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class ListView: TSListView<ListItemView> {
        
        public override func onInit() {
            self.backgroundColor = .white
        }
        
        public override func emptyMessage() -> String {
            return "Waiting..."
        }
        
    }
    
}
