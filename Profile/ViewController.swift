//
//  ViewController.swift
//  Profile
//
//  Created by Yaroslav Savin on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let headText: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.text = "asc"
            label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
            label.textColor = .black
            label.contentMode = .center
            
            return label
        }()
        // Do any additional setup after loading the view.
        view.addSubview(headText)
        
        headText.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        headText.rightAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        headText.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headText.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
    }


}
