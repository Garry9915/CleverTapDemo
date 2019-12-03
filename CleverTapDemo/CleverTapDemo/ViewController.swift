//
//  ViewController.swift
//  CleverTapDemo
//
//  Created by Girish Sonje on 02/12/19.
//  Copyright © 2019 Girish Sonje. All rights reserved.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController {
    
    fileprivate let pushButton : UIButton = {
        let pushButton = UIButton()
        pushButton.setTitle("PUSH", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.backgroundColor = .orange
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        return pushButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupUI()
    }
    
    func setupUI(){
        self.view.addSubview(self.pushButton)
        
        NSLayoutConstraint.activate([
            self.pushButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pushButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.pushButton.widthAnchor.constraint(equalToConstant: 100),
            self.pushButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        self.pushButton.addTarget(self, action: #selector(ViewController.pushDataToCleverTap), for: .touchUpInside)
    }

    @objc func pushDataToCleverTap(){
        CleverTap.sharedInstance()?.profilePush(["Identity" : "22161096", "Email" : "dk+girisonje@clevertap.com", "Phone Number" : "22161096"])
        
        CleverTap.sharedInstance()?.recordEvent("Product Viewed", withProps: ["Product ID" : 1, "Product Name" : "CleverTap", "Product Image" : "https://d35fo82fjcw0y8.cloudfront.net/2018/07/26020307/customer-success-clevertap.jpg"])
    }
}

