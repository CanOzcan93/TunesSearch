//
//  DetailLayout-Main.swift
//  TunesSearch
//
//  Created by Can Özcan on 11.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit
import MapKit

extension Main {
    
    public class DetailLayout: TSLayout {
        
        public var iv_back: TSImageView!
        private var iv_item: TSImageView!
        public var btn_favorite: TSButton!
        private var tv_title: TSTextView!
        private var tv_owner: TSTextView!
        private var tv_price: TSTextView!
        private var mti_info: TSMultilineTextInput!

        public override func onConstruct() {

            constructBackImageView()
            constructItemImageView()
            constructFavoriteButton()
            constructTitleTextView()
            constructOwnerTextView()
            constructPriceTextView()
            constructInfoTextView()
            
        }
        
        private func constructBackImageView() {

            iv_back = TSImageView()
            iv_back.image = imageProvider.getLeftArrow()
            self.addSubview(iv_back)

        }
        
        private func constructItemImageView() {

            iv_item = TSImageView()
            iv_item.backgroundColor = .brown
            self.addSubview(iv_item)

        }
        
        private func constructFavoriteButton() {

            btn_favorite = TSButton()
            btn_favorite.setTitle("Add to Favorites", for: .normal)
            btn_favorite.setTitleColor(colorProvider.getMediumOrchid(), for: .normal)
            self.addSubview(btn_favorite)

        }
        
        private func constructTitleTextView() {

            tv_title = TSTextView()
            tv_title.text = "Item"
            tv_title.font = fontProvider.getSemiboldLarge()
            tv_title.textColor = colorProvider.getLightDeepPink()
            self.addSubview(tv_title)

        }
        
        private func constructOwnerTextView() {

            tv_owner = TSTextView()
            tv_owner.text = "Owner: Can Ozcan"
            tv_owner.font = fontProvider.getRegularMedium()
            tv_owner.textColor = colorProvider.getLightDeepPink()
            self.addSubview(tv_owner)

        }
        
        private func constructPriceTextView() {

            tv_price = TSTextView()
            tv_price.text = "Price: 10 USD"
            tv_price.font = fontProvider.getRegularMedium()
            tv_price.textColor = colorProvider.getLightDeepPink()
            self.addSubview(tv_price)

        }
        
        private func constructInfoTextView() {
            
            mti_info = TSMultilineTextInput()
            mti_info.backgroundColor = .clear
            mti_info.isOpaque = false
            mti_info.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultrices magna nec erat mollis, quis tincidunt orci imperdiet. Maecenas at dapibus neque. Curabitur faucibus orci ligula, a porta nibh dictum id. Fusce ut posuere est. Orci varius natoque penatibus et."
            mti_info.font = fontProvider.getLightSmall()
            mti_info.textColor = colorProvider.getLightDeepPink()
            self.addSubview(mti_info)
            
        }
        
        

        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            constrainBackImageView(set: &set)
            constrainItemImageView(set: &set)
            constrainFavoriteButton(set: &set)
            constrainTitleTextView(set: &set)
            constrainOwnerTextView(set: &set)
            constrainPriceTextView(set: &set)
            constrainInfoTextView(set: &set)
            
        }
        
        private func constrainBackImageView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: iv_back, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 25))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .width, relatedBy: .equal, toItem: iv_back, attribute: .height, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainItemImageView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: iv_item, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_item, attribute: .top, relatedBy: .equal, toItem: iv_back, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_item, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.6, constant: 0))
            set.append(NSLayoutConstraint(item: iv_item, attribute: .height, relatedBy: .equal, toItem: iv_item, attribute: .width, multiplier: 1, constant: 0))
        }
        
        private func constrainFavoriteButton(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: btn_favorite, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_favorite, attribute: .top, relatedBy: .equal, toItem: iv_item, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: btn_favorite, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.7, constant: 0))
            set.append(NSLayoutConstraint(item: btn_favorite, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainTitleTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_title, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 30))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .top, relatedBy: .equal, toItem: btn_favorite, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.7, constant: 0))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
        }
        
        private func constrainOwnerTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_owner, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 30))
            set.append(NSLayoutConstraint(item: tv_owner, attribute: .top, relatedBy: .equal, toItem: tv_title, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: tv_owner, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.7, constant: 0))
            set.append(NSLayoutConstraint(item: tv_owner, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        }
        
        private func constrainPriceTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: tv_price, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 30))
            set.append(NSLayoutConstraint(item: tv_price, attribute: .top, relatedBy: .equal, toItem: tv_owner, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: tv_price, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.7, constant: 0))
            set.append(NSLayoutConstraint(item: tv_price, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
        }
        
        private func constrainInfoTextView(set: inout [NSLayoutConstraint]) {
            set.append(NSLayoutConstraint(item: mti_info, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 30))
            set.append(NSLayoutConstraint(item: mti_info, attribute: .top, relatedBy: .equal, toItem: tv_price, attribute: .bottom, multiplier: 1, constant: 10))
            set.append(NSLayoutConstraint(item: mti_info, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -30))
            set.append(NSLayoutConstraint(item: mti_info, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        }
        
        public override func afterConstrain() {
            
            btn_favorite.applyBorderGradient(colors: [colorProvider.getLightDeepPink().cgColor,colorProvider.getMediumOrchid().cgColor], rect: self.btn_favorite.bounds, rounded: true)
            
        }
        
        public func loadData(item: Item, isFavorite: Bool) {
            
            iv_item.image = item.picture
            tv_title.text = item.name
            tv_owner.text = item.creator
            tv_price.text = "Price: \(item.price) \(item.currency)"
            mti_info.attributedText = item.description?.htmlAttributedString
            
            if isFavorite {
                btn_favorite.setTitle("Drop to Favorites", for: .normal)
                btn_favorite.setTitleColor(.white, for: .normal)
                btn_favorite.applyBackgroundGradient(colors: [colorProvider.getLightDeepPink().cgColor,colorProvider.getMediumOrchid().cgColor], rect: self.btn_favorite.bounds, rounded: true)
            } else {
                btn_favorite.setTitle("Add to Favorites", for: .normal)
                btn_favorite.setTitleColor(colorProvider.getMediumOrchid(), for: .normal)
                btn_favorite.applyBorderGradient(colors: [colorProvider.getLightDeepPink().cgColor,colorProvider.getMediumOrchid().cgColor], rect: self.btn_favorite.bounds, rounded: true)
            }
            
            
        }

    }
}
