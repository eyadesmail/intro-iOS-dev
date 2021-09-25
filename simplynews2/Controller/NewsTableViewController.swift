//
//  NewsTableViewController.swift
//  simplynews2
//
//  Created by Esmail, Eyad Ehab Younis Othman on 5/9/19.
//  Copyright © 2019 Esmail, Eyad Ehab Younis Othman. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController , XMLParserDelegate {
    
    var Feeds : NSArray = []  // array to hold the feeds parsed from the url
    var url: URL!       // variable holding the url
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension        //table view manual cutomization
        tableView.estimatedRowHeight = 140
        tableView.backgroundColor = CustomColor(rgbValue: 0xE0E0E0)     //background color
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        loadrss()
    }
   
    @IBAction func refresh(_ sender: Any) {
        loadrss()
    }
    
    func loadrss() {   //function to read the freds from a specific website
        url = URL(string: "http://rss.cnn.com/rss/edition_us.rss")!
        loadRss(url);
    }
    
    func loadRss(_ data: URL) {     //uses the parser to read the xml page and saves the feeds in the array
        let myParser : XmlParserManager = XmlParserManager().initWithURL(data) as! XmlParserManager
        Feeds = myParser.feeds
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openPageone" {
            let indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
            let selectedURL: String = (Feeds[indexPath.row] as AnyObject).object(forKey: "link") as! String
            // when a cell is pressed, this is a part responsible to open its web page
           
            let newsinstance: NewsWebViewController = segue.destination as! NewsWebViewController
            newsinstance.selectedcellurl = selectedURL as String
        }
    }
    
    // MARK: - Table view data source.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Feeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newscell", for: indexPath)
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        //having cells with different shades
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
        } else {
            cell.backgroundColor = UIColor(white: 1, alpha: 0.1)
        }
        
        cell.textLabel?.text = (Feeds.object(at: indexPath.row) as AnyObject).object(forKey: "title") as? String
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.text = (Feeds.object(at: indexPath.row) as AnyObject).object(forKey: "pubDate") as? String
        cell.detailTextLabel?.textColor = UIColor.black
        return cell
    }
    // function to create manual colors given hex values
    func CustomColor(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
