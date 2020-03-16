//
//  TSFactory.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSFactory<SheetFactoryType: TSSheetFactory, TransitionFactoryType: TSTransitionFactory>{
    
    public var sheetFactory: SheetFactoryType!
    public var transitionFactory: TransitionFactoryType!
    
    public required init() {
        
    }
    
}
