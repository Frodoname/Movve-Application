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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        transparentNavControllerOff()
    }
        
    // MARK: - UI Setup
    
    private func setUpItemModel() {
        itemView.itemName.text = itemModel.name
        itemView.itemDesciption.text = itemModel.description
        itemView.rateLabel.text = String(itemModel.rate)
        itemView.rateProgressBar.progress = Float(itemModel.rate / 10)
        itemView.itemTextInfoLabel.text = "2020 | \(itemModel.genre) | \(itemModel.language)"
        
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
