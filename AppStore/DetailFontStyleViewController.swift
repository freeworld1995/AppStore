//
//  DetailFontStyleViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class DetailFontStyleViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var slider: UISlider!
    var fontStyle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sliderChangeValue(_ sender: UISlider) {
        textView.font = UIFont(name: fontStyle, size: CGFloat(slider.value))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateFontStyle), name: Notification.Name(rawValue: "SingleFontStyle"), object: nil)
    }
    
    func updateFontStyle(notification: Notification) {
        fontStyle = notification.userInfo?["style"] as! String
        textView.font = UIFont(name: fontStyle, size: CGFloat(slider.value))
    }

}
