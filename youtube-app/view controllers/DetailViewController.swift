//
//  DetailViewController.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 27/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // check if there's video
        guard video != nil else {
            return
        }
        
        // create the embed url
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // load into webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // set the title
        titleLabel.text = video!.title
        
        // set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        // set the description
        textView.text = video!.description
    }

}
