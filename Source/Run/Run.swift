//
//  Run.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

@UIApplicationMain
class App: TSApplication {
    
    override func onRootViewController() -> UIViewController? {
        
        print(UserDefaults.standard.dictionaryRepresentation().keys)
        return Main.Module.getInstance().factory!.sheetFactory!.getMainSheet()
        
    }
    
}
