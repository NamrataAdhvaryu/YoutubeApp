//
//  Model.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 05/04/21.
//

import Foundation
class Model
{
    func videos()
    {
    // create url
        let url = URL(string: Constants.API_URL)
    guard url != nil else
    {
    return
    }
    // create session
        let session = URLSession.shared
    // create datatask
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil
            {
                return
            }
            do
            {
              // parsing data into video object
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
               let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch
            {
                
            }
            
        }
        datatask.resume()
    // kick off task
    
}
}
