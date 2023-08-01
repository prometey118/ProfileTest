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
            label.text = "Профиль"
            label.font = UIFont(name: "SFProDisplay-Bold", size: 16)
            label.textColor = .black
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.05
            label.backgroundColor = .green
            label.textAlignment = .center
            return label
        }()
        
        view.addSubview(headText)
        
        
        headText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headText.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headText.topAnchor.constraint(equalTo: view.topAnchor, constant: 62).isActive = true
        
        
        
    }


}

