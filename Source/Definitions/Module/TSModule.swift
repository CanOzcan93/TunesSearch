//
//  TSModule.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class TSModule<FactoryType: TSFactory<SheetFactoryType,TransitionFactoryType>,SheetFactoryType: TSSheetFactory,TransitionFactoryType: TSTransitionFactory, DemonstratorType: TSDemonstrator> {
    
    public var factory: FactoryType!
    public var demonstrator: DemonstratorType!
    
    public required init() {
        
    }
    
}
