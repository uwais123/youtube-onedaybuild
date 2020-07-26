//
//  Constants.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 25/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUgFvT6pUq9HLOvKBYERzXSQ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
