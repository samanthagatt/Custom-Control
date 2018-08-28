//
//  ViewController.swift
//  Custom Control
//
//  Created by Samantha Gatt on 8/28/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: 1 star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }
    
}

