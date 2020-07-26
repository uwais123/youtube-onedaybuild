//
//  ViewController.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 25/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        model.getVideos()
    }


}

