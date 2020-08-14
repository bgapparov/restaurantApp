//
//  BaseView.swift
//  RestaurantApp
//
//  Created by Baiaman Gapparov on 8/13/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import UIKit


@IBDesignable class BaseView: UIView {
     override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        
    }
}
