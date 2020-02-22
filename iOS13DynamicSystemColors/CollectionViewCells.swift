//
//  CollectionViewCell.swift
//  iOS13DynamicSystemColors
//
//  Created by Art Arriaga on 2/20/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//
import UIKit

//MARK: UILabel + inset
class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 10, dy: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: HeaderCell
class HeaderCell: UICollectionViewCell {
    static let reuseIdentifier = "headerCellId"
    
    let sectionTitleLabel: CustomLabel = {
        let l = CustomLabel()
        l.text = "Hi"
        l.font = .boldSystemFont(ofSize: 22)
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sectionTitleLabel)
        sectionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sectionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sectionTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sectionTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: CollectionViewCell
class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "cellId"
    
    var dynamicColor: DynamicColor! {
        didSet {
            self.colorNameLabel.text = dynamicColor.name
            self.colorDescriptionLabel.text = dynamicColor.description
            self.backgroundColor = dynamicColor.color
        }
    }
    
    var colorNameLabel: CustomLabel = {
        let l = CustomLabel()
        l.font = .boldSystemFont(ofSize: 20)
        l.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return l
    }()
    
    var colorDescriptionLabel: CustomLabel = {
        let l = CustomLabel()
        l.numberOfLines = 0
        l.font = .systemFont(ofSize: 12)
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(colorNameLabel)
        self.addSubview(colorDescriptionLabel)
        NSLayoutConstraint.activate([
            colorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            
            colorDescriptionLabel.topAnchor.constraint(equalTo: colorNameLabel.bottomAnchor),
            colorDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
