//
//  TSDemonstrator.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSDemonstrator {
    
    open var sheet: UIViewController!
    open var transition: CATransition!
    
    public required init() {
        
    }
    
    open var current: UIViewController!
    public func setCurrent(vc: UIViewController) {
        current = vc
    }
    
    open func present() {
        
        TSApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: nil)
        
    }
    
    open func present(completion: @escaping () -> ()) {
        
        TSApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: completion)
        
    }
    
    open func dismiss() {
        
        TSApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismiss(completion: @escaping () -> ()) {
        
        TSApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissNotAnimated() {
        
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismissNotAnimated(completion: @escaping () -> ()) {
        
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissViewControllers() {
        TSApplication.window.rootViewController?.dismiss(animated: false) {
        }
    }
    
    open func dismissViewControllers(completion: @escaping () -> ()) {
        TSApplication.window.rootViewController?.dismiss(animated: false) {
            completion()
        }
    }
        
}
