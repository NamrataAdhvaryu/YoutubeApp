//
//  Video.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 05/04/21.
//

import Foundation
struct Video : Decodable {
   var videoId = ""
    var published = Date()
    var description = ""
    var thumbnail = ""
    var title = ""
    
    
    enum CodingKeys: String , CodingKey {
        case resourceId
        case snippet
        case thumbnails
        case high
        
        case published =  "publishedAt"
        case title
        case description
        case videoId
        case thumbnail = "url"
    }
    
    init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetcontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
       // parse title
        
        self.title = try snippetcontainer.decode(String.self, forKey: .title)
        // parse publish date
        
        self.published = try snippetcontainer.decode(Date.self, forKey: .published)
        
        // parse description
        self.description = try snippetcontainer.decode(String.self, forKey: .description)
        
        
        // parse thumbnail
        
        let thumbnailcontainer = try snippetcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highcontainer = try thumbnailcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highcontainer.decode(String.self, forKey: .thumbnail)
        
        
        // parse videoid
        
        
        let resourceidcontainer = try snippetcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceidcontainer.decode(String.self, forKey: .videoId)
        
    }
}
