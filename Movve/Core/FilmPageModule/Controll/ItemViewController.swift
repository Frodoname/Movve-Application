//
//  ItemViewController.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit
import Kingfisher

final class ItemViewController: UIViewController {
    
    private let actorIdCell = "actorIdCell"
    
    private let bookMarkImage = "bookmark"
    private let bookMarkImageFilled = "bookmark.fill"
    
    private var itemView: ItemView!
    var itemModel: ItemModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        transparentNavControllerOn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItemView()
        setUpNavController()
        setUpItemModel()
        delegateSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        transparentNavControllerOff()
    }
    
    // MARK: - Delegate Setup
    
    private func delegateSetup() {
        itemView.actorCollectionView.delegate = self
        itemView.actorCollectionView.dataSource = self
    }
        
    // MARK: - UI Setup
    
    private func setUpItemModel() {
        itemView.itemName.text = itemModel.name
        itemView.itemDesciption.text = itemModel.description
        itemView.rateLabel.text = String(itemModel.rate)
        itemView.rateProgressBar.progress = Float(itemModel.rate / 10)
        itemView.itemTextInfoLabel.text = "\(itemModel.dateFormatted) | \(itemModel.genre) | \(itemModel.language)"
        
        guard let imageUrl = URL(string: itemModel.originalImage) else {
            return
        }
        itemView.image.kf.indicatorType = .activity
        itemView.image.kf.setImage(with: imageUrl)
    }
    
    private func setUpItemView() {
        itemView = ItemView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(itemView)
    }
    
    // MARK: - Navigation ControllerSetUp

    private func transparentNavControllerOn() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func transparentNavControllerOff() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    private func setUpNavController() {
        let systemIcon = UIImage(systemName: bookMarkImage)
        let addToFavouriteButton = UIBarButtonItem(image: systemIcon, style: .plain, target: self, action: #selector(addedToFavourite))
        navigationItem.rightBarButtonItem = addToFavouriteButton
        
        itemView.scrollView.insetsLayoutMarginsFromSafeArea = false
        itemView.scrollView.contentInsetAdjustmentBehavior = .never
    }
        
    // MARK: - Action
    
    private var toogleSwitchedOn: Bool = false
    
    @objc private func addedToFavourite(sender: UIBarButtonItem) {
        toogleSwitchedOn.toggle()
        if toogleSwitchedOn {
            sender.image = UIImage(systemName: bookMarkImageFilled)
            print("In the Fav list")
        } else {
            sender.image = UIImage(systemName: bookMarkImage)
            print("Removed from Fav list")
        }
    }
}

extension ItemViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: actorIdCell, for: indexPath)
        cell.backgroundColor = .white
        guard let typedCell = cell as? ActorCell else {
            return cell
        }
        typedCell.configureCell()
        return typedCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 78, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}
