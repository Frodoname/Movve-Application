//
//  ItemViewController.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit

final class ItemViewController: UIViewController, UIScrollViewDelegate {
    
    private var itemView: ItemView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItemView()
    }
    
    private func setUpItemView() {
        itemView = ItemView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(itemView)
        itemView.scrollView.delegate = self
        
        itemView.scrollView.minimumZoomScale = 1.0
        itemView.scrollView.maximumZoomScale = 5.0

    }
}

//extension ItemViewController: UIScrollViewDelegate {
//    scrollView.minimumZoomScale = 1.0
//    scrollView.maximumZoomScale = 5.0
//}
