//
//  WebViewController.swift
//  PeopleInformation
//
//  Created by Manav Verma on 17/02/2025.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var webURL: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weburl = URL(string: webURL) ?? URL(string: "https://www.google.com/")
        
        let webURLRequest = URLRequest(url: weburl!)
            
        webView.load(webURLRequest)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
