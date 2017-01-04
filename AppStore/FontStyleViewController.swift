//
//  FontStyleViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class FontStyleViewController: UIViewController {
    
    var font = Font()
    var selectedIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateFont(notification: Notification) {
        let object = notification.userInfo?["font"] as! Font
        font = object
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateFont), name: Notification.Name(rawValue: "SingleFont"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard font.style?.count != 0 else {return}
        
        NotificationCenter.default.post(name: NSNotification.Name("SingleFontStyle"), object: nil, userInfo: ["style": font.style?[selectedIndex] ?? ""])
    }
    
    func favoriteTouched(sender:UIButton) {
        let ac = UIAlertController(title: "", message: "Add to favorite ?", preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
            let userDefault = UserDefaults.standard
            var array = userDefault.object(forKey: "favorite") as? [String] ?? [String]()
            array.append(self.font.style![sender.tag])
            userDefault.set(array, forKey: "favorite")
        }
        
        ac.addAction(acceptAction)
        ac.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        present(ac, animated: true)
        
    }
}

extension FontStyleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard font.style != nil else {return 0}
        return font.style!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontStyleCell", for: indexPath) as! FontStyleTableViewCell
        cell.label.text = font.style![indexPath.row]
        cell.label.font = UIFont(name: font.style![indexPath.row], size: 11)
        cell.favorite.tag = indexPath.row
        cell.favorite.addTarget(self, action: #selector(favoriteTouched), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FontStyleDetail") as? DetailFontStyleViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
