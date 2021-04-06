//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 05/04/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ModelDelegate {
    
    

    @IBOutlet weak var tableview: UITableView!
    public var model = Model()
    public var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        //delegate to model
        
        model.delegate = self
        model.videos()
    }
    
    // MARK:// model delegate Methods
    
    func videofatched(_ videos: [Video]) {
        //set videos to our video property
        self.videos = videos
        
        //reload tableview
        tableview.reloadData()
    }
    
    
    
    // MARK:// tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        // get the data
        let video = videos[indexPath.row]
        cell.setCell(video)
        
        // return cell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}


