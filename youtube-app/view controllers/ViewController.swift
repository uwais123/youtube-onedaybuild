//
//  ViewController.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 25/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // set it self as a dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // set itself as delegate model
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        // set the returned videos to our video property
        self.videos = videos
        
        // refresh the tableview
        tableView.reloadData()
        
    }

    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
        return videos.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // configure the cell with data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // return the call
        return cell
        
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

