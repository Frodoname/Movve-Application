//
//  LastCell.swift
//  Movve
//
//  Created by Fed on 31.08.2022.
//

import Foundation
import UIKit

final class LastCell: UICollectionViewCell {
    
    private let systemImage = "arrow.forward.circle"
    
    private lazy var centralButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: systemImage)
        image.tintColor = .white
        image.prepareForAutoLayOut()
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return image
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        label.text = "Show All"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraits() {
        addSubview(centralButton)
        addSubview(label)
        
        centralButton.prepareForAutoLayOut()
        label.prepareForAutoLayOut()
        
        NSLayoutConstraint.activate([
            centralButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            centralButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            
            label.topAnchor.constraint(equalTo: centralButton.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
