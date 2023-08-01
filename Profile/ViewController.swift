//
//  ViewController.swift
//  Profile
//
//  Created by Yaroslav Savin on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    private var collectionView: UICollectionView!
        private var dataSource: MyDataSource!
    private var isDeleteEnabled = false
    private var deleteButton: UIButton!
    private var addButton: UIButton!
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
            let image0 = UIImage(named: "ph2.png")?.cgImage
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
        setupCollectionView()
        loadData()
        setupDeleteButton()
    }

    private func setupDeleteButton() {
            deleteButton = UIButton(type: .system)
            deleteButton.setTitle("Удалить элементы", for: .normal)
            deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)

            addButton = UIButton(type: .system)
            addButton.setTitle("Добавить элементы", for: .normal)
            addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

            let stackView = UIStackView(arrangedSubviews: [deleteButton, addButton])
            stackView.axis = .vertical
            stackView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
            ])
        }
    
    @objc private func deleteButtonTapped() {
        isDeleteEnabled = !isDeleteEnabled
        if isDeleteEnabled {
            deleteButton.setTitle("Отменить", for: .normal)
        } else {
            deleteButton.setTitle("Удалить элементы", for: .normal)
        }
        // Обновляем кнопку напрямую
        deleteButton.setNeedsLayout()
        deleteButton.layoutIfNeeded()
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
                let layoutSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(100),
                    heightDimension: .absolute(32)
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: layoutSize.heightDimension
                    ),
                    subitems: Array(repeating: .init(layoutSize: layoutSize), count: 6) // Repeat the layoutSize 6 times
                )
                group.interItemSpacing = .fixed(12)

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                section.interGroupSpacing = 12
                return section
            }
            
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
            collectionView.backgroundColor = .white
            collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
            dataSource = MyDataSource()
            collectionView.dataSource = dataSource
            view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5) // Здесь collectionView будет занимать половину высоты экрана
                ])
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                collectionView.addGestureRecognizer(tapGestureRecognizer)
        }
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        // Get the tapped point in the collection view
        let tapLocation = sender.location(in: collectionView)

        // Find the item index that was tapped
        if let indexPath = collectionView.indexPathForItem(at: tapLocation) {
            if isDeleteEnabled {
                // Remove the tapped item from the data source
                dataSource.data.remove(at: indexPath.item)

                // Update the collection view
                collectionView.deleteItems(at: [indexPath])
            } else {
                // Perform any other action when delete is not enabled
                // For example, you can show a detail view or do nothing
            }
        }
    }
        
        private func loadData() {
            // Загружаем данные и обновляем dataSource
            dataSource.data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
            collectionView.reloadData()
        }
    class MyDataSource: NSObject, UICollectionViewDataSource {
        var data: [String] = []
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
            cell.textLabel.text = data[indexPath.item]
            return cell
        }
        
    }
    class MyCell: UICollectionViewCell {
        let textLabel = UILabel()
        let deleteButton = UIButton(type: .system)

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }

        private func setupViews() {
            // Настройка внешнего вида ячейки, включая UILabel и UIButton
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            deleteButton.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview(textLabel)
            
            NSLayoutConstraint.activate([
                textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
            
        }
    }
    private func deleteAction(for indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (action, view, completion) in
            if self?.isDeleteEnabled == true {
                // Удалите элемент из источника данных
                self?.dataSource.data.remove(at: indexPath.item)

                // Обновите коллекцию
                self?.collectionView.deleteItems(at: [indexPath])
            }
            completion(true)
        }
        return action
    }

       // Реализуйте делегат UICollectionViewDelegate для отображения свайпов
       func collectionView(_ collectionView: UICollectionView, trailingSwipeActionsConfigurationForItemAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           if isDeleteEnabled {
               let delete = deleteAction(for: indexPath)
               return UISwipeActionsConfiguration(actions: [delete])
           }
           return nil
       }
    private func showAddItemPopup() {
            let alertController = UIAlertController(title: "Добавить элемент", message: nil, preferredStyle: .alert)

            alertController.addTextField { textField in
                textField.placeholder = "Введите новый элемент"
            }

            let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
                if let newItem = alertController.textFields?.first?.text, !newItem.isEmpty {
                    // Add the new item to the data source
                    self?.dataSource.data.append(newItem)

                    // Update the collection view
                    let newIndexPath = IndexPath(item: self?.dataSource.data.count ?? 0, section: 0)
                    self?.dataSource.data.append("New Item") // Здесь добавляем новый элемент в массив данных
                    self?.collectionView.insertItems(at: [newIndexPath])


                }
            }

            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

            alertController.addAction(addAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true, completion: nil)
        }
    @objc private func addButtonTapped() {
        let alertController = UIAlertController(title: "Добавить элемент", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self, weak alertController] _ in
            guard let textField = alertController?.textFields?.first, let newItem = textField.text else {
                return
            }
            self?.addNewItem(newItem: newItem)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    private func addNewItem(newItem: String) {
        dataSource.data.append(newItem) // Добавляем новый элемент в массив данных
        
        let newIndexPath = IndexPath(item: dataSource.data.count - 1, section: 0)
        collectionView.performBatchUpdates({ [weak self] in
            self?.collectionView.insertItems(at: [newIndexPath])
        }, completion: nil)
    }


}

