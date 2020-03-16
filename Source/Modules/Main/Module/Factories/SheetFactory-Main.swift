//
//  SheetFactory-Main.swift
//  TunesSearch
//
//  Created by Can Özcan on 11.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class SheetFactory: TSSheetFactory {
        
        private var mainSheet: MainSheet?
        public func getMainSheet() -> MainSheet {

            guard mainSheet != nil else {
                mainSheet = MainSheet()
                return mainSheet!
            }

            return mainSheet!

        }
        
        private var detailSheet: DetailSheet?
        public func getDetailSheet() -> DetailSheet {

            guard detailSheet != nil else {
                detailSheet = DetailSheet()
                return detailSheet!
            }

            return detailSheet!

        }
        
        
    }
}
