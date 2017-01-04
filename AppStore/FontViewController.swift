//
//  FontViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var model: Model!
    var fonts = [Font]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        model = Model()
        model.getFonts()
        fonts = model!.fonts
        registerCell()
    }
    
    func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FontCell")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "SingleFont"), object: nil, userInfo: ["font": fonts[selectedIndex]])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension FontViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fonts.count
        }
        else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = fonts[indexPath.row].name!
            cell.textLabel?.font = UIFont(name: fonts[indexPath.row].name!, size: 12)
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = "Favorites"
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        if indexPath.section == 0 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "FontStyle") as? FontStyleViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Favorite") as? FavoriteViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "All Font Families "
        }
        return "My Font Favorites"
    }
}
