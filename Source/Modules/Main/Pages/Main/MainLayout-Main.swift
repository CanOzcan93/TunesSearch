//
//  MainLayout-Main.swift
//  TunesSearch
//
//  Created by Can Özcan on 11.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class MainLayout: TSLayout {

        public var lv: ListView!
        public var ti: TSTextInput!
        public var scope: ScopeSlider!
        
        public override func onConstruct() {

            self.backgroundColor = .white

            constructTextInput()
            constructScopeSlider()
            constructListView()
            
        }
        
        private func constructTextInput() {
            
            ti = TSTextInput()
            ti.textColor = colorProvider.getDarkGray()
            ti.setPlaceholder(text: "Search", placeholderColor: UIColor.lightGray)
            ti.onPressReturnInKeyboard = {
                self.endEditing(true)
            }
            self.addSubview(ti)
            
        }
        
        private func constructListView() {
            

            lv = ListView(items: [])
            self.addSubview(lv)
            
        }
        
        private func constructScopeSlider(){
            
            scope = ScopeSlider(items: [
                ScopeSliderItem(title: "All"),
                ScopeSliderItem(title: "Movie"),
                ScopeSliderItem(title: "Podcast"),
                ScopeSliderItem(title: "Music"),
                ScopeSliderItem(title: "Music Video"),
                ScopeSliderItem(title: "Audiobook"),
                ScopeSliderItem(title: "Short Film"),
                ScopeSliderItem(title: "Tv Show"),
                ScopeSliderItem(title: "Software"),
                ScopeSliderItem(title: "Ebook")],layout: self, spacePages: 10)
            self.addSubview(scope)
            
        }


        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            constrainTextInput(set: &set)
            constrainScopeSlider(set: &set)
            constrainListView(set: &set)
            
        }
        
        private func constrainTextInput(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: ti, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: ti, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 50))
            set.append(NSLayoutConstraint(item: ti, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.9, constant: 0))
            set.append(NSLayoutConstraint(item: ti, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
            
        }
        
        private func constrainScopeSlider(set: inout [NSLayoutConstraint]){
            
            set.append(NSLayoutConstraint(item: scope, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: scope, attribute: .top, relatedBy: .equal, toItem: ti, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: scope, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: scope, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
            
        }
        
        private func constrainListView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: lv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .top, relatedBy: .equal, toItem: scope, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: lv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
            
        }
        
        public override func afterConstrain() {
            
            self.ti.applyBorderGradient(colors: [self.colorProvider.getLightDeepPink().cgColor,self.colorProvider.getSteelPink().cgColor], rect: self.ti.bounds)
            
        }
        
        


    }
}
