//
//  ActorCell.swift
//  Movve
//
//  Created by Fed on 04.09.2022.
//

import Foundation
import UIKit
import Kingfisher

final class ActorCell: UICollectionViewCell {
    
    func configureCell() {
        
    }
    
    // MARK: - UI Elements
    
    private lazy var imageActor: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.prepareForAutoLayOut()
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return imageView
    }()
    
    private lazy var actorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = ColorScheme.textDesriptionColor
        label.textAlignment = .center
        label.text = "Jusin Cotez"
        return label
    }()
    
    private lazy var actorRole: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        label.textAlignment = .center
        label.text = "James Cat"
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Constraits
    
    private func layoutSetup() {
        addSubview(imageActor)
        addSubview(actorName)
        addSubview(actorRole)
        
        imageActor.prepareForAutoLayOut()
        actorName.prepareForAutoLayOut()
        actorRole.prepareForAutoLayOut()
        
        NSLayoutConstraint.activate([
            imageActor.topAnchor.constraint(equalTo: topAnchor),
            imageActor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9),
            imageActor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            
            actorName.topAnchor.constraint(equalTo: imageActor.bottomAnchor),
            actorName.leadingAnchor.constraint(equalTo: leadingAnchor),
            actorName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            actorRole.topAnchor.constraint(equalTo: actorName.bottomAnchor),
            actorRole.leadingAnchor.constraint(equalTo: leadingAnchor),
            actorRole.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
