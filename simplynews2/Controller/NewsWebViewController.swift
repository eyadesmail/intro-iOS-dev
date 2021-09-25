//  NewsWebViewController.swift
//  simplynews2
//
//  Created by Esmail, Eyad Ehab Younis Othman on 5/9/19.
//  Copyright © 2019 Esmail, Eyad Ehab Younis Othman. All rights reserved.
//

import UIKit
import WebKit
class NewsWebViewController: UIViewController {

    @IBOutlet var webpage: WKWebView!
    var selectedcellurl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedcellurl =  selectedcellurl?.replacingOccurrences(of: " ", with:"")
        selectedcellurl = selectedcellurl?.replacingOccurrences(of: "\n", with:"")
        // above code removes spaces in the link to open it without errors. needed to work with the parser.
        //bellow code opens the url in the web page
        webpage.load(URLRequest(url: URL(string: selectedcellurl! as String)!))
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
