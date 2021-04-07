//
//  DetailViewController.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 06/04/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var video:Video?
    @IBOutlet weak var textview: UITextView!
   
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var titlelbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textview.text = ""
        datelabel.text = ""
        titlelbl.text = ""
        guard  video != nil else {
            return
        }
        let emnededurlstring = Constants.YT_EMBEDED_URL + video!.videoId
        let url = URL(string: emnededurlstring)
        let request = URLRequest(url: url!)
        webview.load(request)
        
        titlelbl.text = video!.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        datelabel.text = df.string(from: video!.published)
        textview.text = video!.description
        
    }
    
    }
    


