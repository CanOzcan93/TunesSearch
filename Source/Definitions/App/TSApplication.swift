//
//  TSApplication.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation
import UIKit

open class TSApplication: UIResponder, UIApplicationDelegate {
 
    public static var instance: TSApplication!
    public static var window: UIWindow!
    public static var application: UIApplication!
        
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        TSApplication.instance = self
        TSApplication.window = UIWindow(frame: UIScreen.main.bounds)
        TSApplication.application = application
        
        TSApplication.window.rootViewController = onRootViewController()!
        TSApplication.window.makeKeyAndVisible()
        
        TSApplication.window.backgroundColor = UIColor.white
        
        return true
        
    }
    
    open func onRootViewController() -> UIViewController? {
        return nil
    }
    
}
