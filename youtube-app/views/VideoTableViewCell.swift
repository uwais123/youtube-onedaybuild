//
//  VideoTableViewCell.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 26/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        // ensure that we have a video
        guard self.video != nil else{
            return
        }
        
        // set the title
        self.titleLabel.text = video?.title
        
        
        // and date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // set the thumbnail imageView
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // get the shared url session object
        let session = URLSession.shared
        
        // create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
             
            if error == nil && data != nil {
                
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // check the downloaded image match with video thumbnail
                if url!.absoluteString != self.video?.thumbnail {
                    // video cell has been recycled to another video
                    return
                }
                
                // create the image object
                let image = UIImage(data: data!)
                
                // set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
            
        }
        // start data task
        dataTask.resume()
        
    }

}
