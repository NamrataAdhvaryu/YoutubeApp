//
//  Commoncode.swift
//  YoutubeApp
//
//  Created by Namrata Akash on 07/04/21.
//

import UIKit

class Commoncode: NSObject {
    func pushVC(acurrentvc:UIViewController,anextvcidentifier:String)  {
        let stroryboardobj = acurrentvc.storyboard?.instantiateViewController(withIdentifier: anextvcidentifier)
        acurrentvc.navigationController?.pushViewController(stroryboardobj!, animated: true)
    }
    func pushVCwithoutanimation(acurrentvc:UIViewController,anextvcidentifier:String)
    {
        let storyboardob = acurrentvc.storyboard?.instantiateViewController(withIdentifier: anextvcidentifier)
        acurrentvc.navigationController?.pushViewController(storyboardob!, animated: false)
    }
}
