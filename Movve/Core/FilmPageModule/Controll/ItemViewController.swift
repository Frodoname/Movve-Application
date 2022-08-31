//
//  ItemViewController.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit

final class ItemViewController: UIViewController {
    
    private var itemView: ItemView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItemView()
        setUpNavController()
    }
    
    private func setUpItemView() {
        itemView = ItemView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(itemView)
    }
    
    private func setUpNavController() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(closeScreen))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func closeScreen() {
        self.dismiss(animated: true)
    }
}
