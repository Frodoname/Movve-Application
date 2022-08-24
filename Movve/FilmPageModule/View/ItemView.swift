//
//  ItemView.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit

final class ItemView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        return view
    }()
    
    private lazy var contentView: UIView = {
       let view = UIView()
        
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .green
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraits() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.prepareForAutoLayOut()
        
        
    }
}
