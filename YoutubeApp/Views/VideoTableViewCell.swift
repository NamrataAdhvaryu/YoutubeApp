//
//  VideoTableViewCell.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 06/04/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailimageview:UIImageView!
    @IBOutlet weak var lbltitle:UILabel!
    @IBOutlet weak var datelabel:UILabel!
    
    
    var videos:Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(_ v:Video) {
        self.videos = v
        
        
        
        guard  self.videos != nil else {
            return
        }
        self.lbltitle.text = videos?.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.datelabel.text = df.string(from: videos!.published)
        //set the thumbnail
        guard self.videos?.thumbnail != "" else {
            return
        }
        if let cachedata = Cachemanager.getvideocathe(self.videos!.thumbnail)
        
        {
            self.thumbnailimageview.image = UIImage(data: cachedata)
            return
        }
        //download thumbnail data
        let url = URL(string: self.videos!.thumbnail)
        //get urlsession object
        let session = URLSession.shared
        //create datatask
        
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil
            
            {
                Cachemanager.setvideocache(url!.absoluteString, data: data)
                if url?.absoluteString != self.videos?.thumbnail
                {
                    return
                }
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.thumbnailimageview.image = image
                }
                
            }
            
        }
        datatask.resume()
        
    }

}
