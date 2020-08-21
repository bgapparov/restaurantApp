//
//  LocationViewController.swift
//  RestaurantApp
//
//  Created by Baiaman Gapparov on 8/13/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationView: LocationView!
    var locationService: LocationService?

    override func viewDidLoad() {
        super.viewDidLoad()

        locationView.didTapAllow = { [weak self] in
            self?.locationService?.requestLocationAuthorithation()
        }
        
        locationService?.didChangeStatus = {[weak self] success in
            if success {
                self?.locationService?.getLocation()
            }
        }
        
        locationService?.newLocation = {[weak self] result in
            switch result {
            case .success(let location):
                print(location)
            case .failure(let error):
                assertionFailure("Error getting the users location \(error)")
            }
        }
    }

}
