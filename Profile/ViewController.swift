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
            label.textAlignment = .center
            return label
        }()
        
        
        
        let image: UIView = {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
            let image0 = UIImage(named: "Image.png")?.cgImage
            let layer0 = CALayer()
            layer0.contents = image0
            layer0.bounds = view.bounds
            layer0.position = view.center
            view.layer.addSublayer(layer0)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        let name: UILabel = {
            let label = UILabel()
            label.text = "Савин Ярослав"
            return label
        }()
        view.addSubview(headText)
        view.addSubview(image)
        
        headText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headText.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headText.topAnchor.constraint(equalTo: view.topAnchor, constant: 62).isActive = true
        image.topAnchor.constraint(equalTo: headText.bottomAnchor, constant: 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        
        
        
    }


}

