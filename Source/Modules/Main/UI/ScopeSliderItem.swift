//
//  ScopeSliderItem.swift
//  TunesSearch
//
//  Created by Can Özcan on 13.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class ScopeSliderItem: TSSliderItem {
        
        public var btn: TSButton!
        public var title: String!
        private var isInit = false
        
        public required init(title: String) {
            
            self.title = title
            super.init()
            
            
        }
        
        required init() {
            super.init()
        }
        
        required init?(coder decoder: NSCoder) {
            super.init(coder: decoder)
        }
        
        public override func onConstruct() {
            super.onConstruct()
            constructButton()
        }
        
        private func constructButton() {
            
            btn = TSButton()
            btn.setTitle(self.title, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.onDraw = { rect in
                if !self.isInit {
                    if self.title == "All" {
                        self.activateButton(state: true)
                    } else {
                        self.activateButton(state: false)
                    }
                    self.isInit = true
                }
            }
            self.addSubview(btn)
            
        }
        
        public override func onConstrain() {
            super.onConstrain()
            
            constrainButton()
        }
        
        private func constrainButton() {
            
            self.constrain(constraint: NSLayoutConstraint(item: btn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            self.constrain(constraint: NSLayoutConstraint(item: btn, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            self.constrain(constraint: NSLayoutConstraint(item: btn, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            self.constrain(constraint: NSLayoutConstraint(item: btn, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0))
            
        }
        
        public func activateButton(state:Bool) {
            
            if state {
                self.btn.applyBackgroundGradient(colors: [self.colorProvider.getLightDeepPink().cgColor,self.colorProvider.getSteelPink().cgColor], rect: self.btn.bounds, rounded: true)
                btn.setTitleColor(.white, for: .normal)
            } else {
                self.btn.backgroundColor = .white
                self.btn.applyBorderGradient(colors: [self.colorProvider.getLightDeepPink().cgColor,self.colorProvider.getSteelPink().cgColor], rect: self.btn.bounds, rounded: true)
                btn.setTitleColor(self.colorProvider.getSteelPink(), for: .normal)
            }
        }
        
        
        
    }
    
}


