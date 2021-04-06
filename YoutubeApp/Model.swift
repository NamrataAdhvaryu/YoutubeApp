//
//  Model.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 05/04/21.
//

import Foundation

protocol  ModelDelegate {
    func videofatched(_ videos:[Video])
}
class Model

{
    var delegate:ModelDelegate?
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
                if response.items != nil
                {
                    DispatchQueue.main.async {
                        self.delegate?.videofatched(response.items!)
                    }
                   
//                dump(response)
                }
            }
            catch
            {
                
            }
            
        }
        datatask.resume()
    // kick off task
    
}
}
