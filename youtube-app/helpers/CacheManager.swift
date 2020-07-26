//
//  CacheManager.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 26/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String,_ data: Data?) {
        // store the image url and store as a key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        // try to get data for specified url
        return cache[url]
    }
    
}
