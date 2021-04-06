//
//  Cachemanager.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 06/04/21.
//

import Foundation
class Cachemanager {
    
    static var cache = [String:Data]()
    static func setvideocache(_ url:String,data:Data?)
    {
        cache[url] = data
    }
    static func getvideocathe(_ url:String) -> Data?
    {
        return cache[url]
    }
}
