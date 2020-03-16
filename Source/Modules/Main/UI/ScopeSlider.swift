//
//  ScopeSlider.swift
//  TunesSearch
//
//  Created by Can Özcan on 13.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class ScopeSlider: TSSlider<ScopeSliderItem,MainLayout> {
        
        
        public override func onConstrain() {
            super.onConstrain()
            
            for i in 0..<self.items.count {
                if i == 0 {
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: CGFloat(self.spacePages)))
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120))
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0))
                }
                else {
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .left, relatedBy: .equal, toItem: self.items[i-1], attribute: .right, multiplier: 1, constant:CGFloat(self.spacePages)))
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .centerY, relatedBy: .equal, toItem: self.items[i-1], attribute: .centerY, multiplier: 1, constant: 0))
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .width, relatedBy: .equal, toItem: self.items[i-1], attribute: .width, multiplier: 1, constant: 0))
                    self.constrain(constraint: NSLayoutConstraint(item: self.items[i], attribute: .height, relatedBy: .equal, toItem: self.items[i-1], attribute: .height, multiplier: 1, constant: 0))
                }
                
            }
            
        }
        
        
    }
    
}
