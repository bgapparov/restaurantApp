//
//  LocationView.swift
//  RestaurantApp
//
//  Created by Baiaman Gapparov on 8/13/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import UIKit

@IBDesignable class LocationView: BaseView {

    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    
    @IBAction func allowAction(_ sender: UIButton) {
        didTapAllow?()
    }
    
    @IBAction func denyAction(_ sender: UIButton) {
           
       }

}
