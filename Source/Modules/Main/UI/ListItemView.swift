//
//  ListItemView.swift
//  TunesSearch
//
//  Created by Can Özcan on 13.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class ListItemView : TSListItemView {
        
        private var iv: TSImageView!
        private var tv_title: TSTextView!
        private var tv_subtitle: TSTextView!
        public var iv_favorite: TSImageView!
        
        
        public var isFavorite: Bool = false
        private var isInitialized: Bool = false
        
        public override func onInit() {
            self.item = TSView()
            self.item.isOpaque = false
            self.isUserInteractionEnabled = true
            self.selectionStyle = .none
            
            
            self.item.onDraw = { rect in

                if !self.isInitialized {
                    
                    let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height*0.2).cgPath
                    let shadowPath = UIBezierPath(roundedRect: rect.inset(by: UIEdgeInsets(top: -0.1, left: -0.1, bottom: -0.1, right: -0.1)), cornerRadius: 8).cgPath

                    let layer = CAShapeLayer()
                    layer.path = path
                    layer.fillColor = self.colorProvider.getMediumOrchid().cgColor

                    layer.shadowColor = self.colorProvider.getBlackFull().cgColor
                    layer.shadowPath = shadowPath
                    layer.shadowOffset = .zero
                    layer.shadowOpacity = 0.2
                    layer.shadowRadius = 8

                    self.item.layer.insertSublayer(layer, at: 0)
                    self.isInitialized = true
                    
                }

            }
            
            contentView.addSubview(self.item)
        }
        
        public override func onConstruct(wrapper: UIView, item: TSView) {
            super.onConstruct(wrapper: wrapper, item: item)
            
            constructImageView(item: item)
            constructTitleTextView(item: item)
            constructSubtitleTextView(item: item)
            constructFavoriteImageView(item: item)
            
        }
        
        private func constructImageView(item: TSView) {
            
            self.iv = TSImageView()
            item.addSubview(self.iv)
            
        }
        
        private func constructTitleTextView(item: TSView) {

            self.tv_title = TSTextView()
            self.tv_title.textColor = .white
            self.tv_title.font = fontProvider.getRegularSmaller()
            self.tv_title.numberOfLines = 2
            self.tv_title.text = "Can"
            
            item.addSubview(self.tv_title)

        }

        private func constructSubtitleTextView(item: TSView) {
            
            self.tv_subtitle = TSTextView()
            self.tv_subtitle.textColor = .white
            self.tv_subtitle.font = fontProvider.getLightSmaller()
            self.tv_subtitle.numberOfLines = 2
            self.tv_subtitle.text = "Ozcan"
            
            item.addSubview(self.tv_subtitle)
            
        }
        
        private func constructFavoriteImageView(item: TSView) {
            
            self.iv_favorite = TSImageView()
            self.iv_favorite.image = imageProvider.getStar()
            self.iv_favorite.alpha = 0
            
            item.addSubview(self.iv_favorite)
            
        }
        
        public override func onConstrain(set: inout [NSLayoutConstraint], wrapper: UIView, item: TSView) {
            
            super.onConstrain(set: &set, wrapper: wrapper, item: item)
            
            set.append(NSLayoutConstraint(item: wrapper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 120))
            
            set.append(NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: wrapper, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: wrapper, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: wrapper, attribute: .top, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: wrapper, attribute: .bottom, multiplier: 1, constant: -15))
            
            constrainImageView(set: &set, item: item)
            constrainTitleTextView(set: &set, wrapper: wrapper, item: item)
            constrainSubtitleTextView(set: &set, wrapper: wrapper, item: item)
            constrainFavoriteImageView(set: &set, item: item)
            
        }
        
        private func constrainImageView(set: inout [NSLayoutConstraint],item: TSView) {
            
            set.append(NSLayoutConstraint(item: iv, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 7.5))
            set.append(NSLayoutConstraint(item: iv, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: iv, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: iv, attribute: .width, relatedBy: .equal, toItem: iv, attribute: .height, multiplier: 1, constant: 0))
            
        }
        
        private func constrainTitleTextView(set: inout [NSLayoutConstraint], wrapper: UIView, item: TSView) {

            set.append(NSLayoutConstraint(item: tv_title, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 4))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .left, relatedBy: .equal, toItem: iv, attribute: .right, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .right, relatedBy: .equal, toItem: iv_favorite, attribute: .left, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .height, relatedBy: .equal, toItem: item, attribute: .height, multiplier: 0.4, constant: 0))

        }

        private func constrainSubtitleTextView(set: inout [NSLayoutConstraint], wrapper: UIView, item: TSView) {

            set.append(NSLayoutConstraint(item: tv_subtitle, attribute: .top, relatedBy: .equal, toItem: tv_title, attribute: .bottom, multiplier: 1, constant: 4))
            set.append(NSLayoutConstraint(item: tv_subtitle, attribute: .left, relatedBy: .equal, toItem: iv, attribute: .right, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_subtitle, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: tv_subtitle, attribute: .height, relatedBy: .equal, toItem: item, attribute: .height, multiplier: 0.4, constant: 0))
            

        }
        
        private func constrainFavoriteImageView(set: inout [NSLayoutConstraint],item: TSView) {
            
            set.append(NSLayoutConstraint(item: iv_favorite, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -17.5))
            set.append(NSLayoutConstraint(item: iv_favorite, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: iv_favorite, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 20))
            set.append(NSLayoutConstraint(item: iv_favorite, attribute: .width, relatedBy: .equal, toItem: iv_favorite, attribute: .height, multiplier: 1, constant: 0))
            
        }
        
        public func addAction(onClick: @escaping Action) {
            
            self.item.onTap {
                onClick()
            }
            
        }
        
        public func loadData(item: Item, isFavorite:Bool){
            
            self.iv.image = item.picture
            self.tv_title.text = item.name
            self.tv_subtitle.text = item.creator
            self.iv_favorite.alpha = isFavorite ? 1 : 0
            self.isFavorite = isFavorite
            
        }
        
    }
    
}
