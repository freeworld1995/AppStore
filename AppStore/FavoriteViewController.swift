//
//  FavoriteViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    var styleArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         }
    
    override func awakeFromNib() {
        
        let userDefault = UserDefaults.standard
        if let data = userDefault.object(forKey: "favorite") as? [String] {
            styleArray = data
        }

    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard styleArray.count != 0 else { return 0 }
        return styleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        cell.textLabel?.text = styleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            styleArray.remove(at: indexPath.row)
            let userDefault = UserDefaults.standard
            userDefault.set(styleArray, forKey: "favorite")
            
            tableView.reloadData()
        }
    }
}
