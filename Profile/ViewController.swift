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
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = .black
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.05
            label.textAlignment = .center
            return label
        }()
        
        
        
        let image: UIView = {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
            let image0 = UIImage(named: "ph.png")?.cgImage
            let layer0 = CALayer()
            layer0.contents = image0
            layer0.bounds = view.bounds
            layer0.position = view.center
            view.layer.addSublayer(layer0)
            view.backgroundColor = .blue
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        let name: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 2
            label.text = "Савин Ярослав Николаевич"
            label.font = UIFont.systemFont(ofSize: 30)
            label.textAlignment = .center
            return label
        }()
        let job: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 1
            label.text = "Junior iOS-разработчик, опыт 1 год"
            label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
            label.textAlignment = .center
            return label
        }()
        let city: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 1
            label.text = "Москва"
            label.textAlignment = .center
            label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
            return label
        }()

        view.addSubview(headText)
        view.addSubview(image)
        view.addSubview(name)
        view.addSubview(job)
        view.addSubview(city)

        
        setUpConstraint()
        

        
        func setUpConstraint() {
            headText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            headText.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            headText.topAnchor.constraint(equalTo: view.topAnchor, constant: 62).isActive = true
            image.topAnchor.constraint(equalTo: headText.bottomAnchor, constant: 50).isActive = true
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 150).isActive = true
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            name.widthAnchor.constraint(equalToConstant: 350).isActive = true
            job.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
            job.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            city.topAnchor.constraint(equalTo: job.bottomAnchor, constant: 20).isActive = true
            city.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        }
        
    }

    
}

