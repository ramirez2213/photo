//
//  PhotoCell.swift
//  TestForDnepr
//
//  Created by Konstantin Chukhas on 05.11.2019.
//  Copyright © 2019 Konstantin Chukhas. All rights reserved.
//

import Foundation
import UIKit
class  PhotoCell: UICollectionViewCell {
    static let reuseId = "PhotoCell"
    
    let photoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // чтобы фиксировать данный елемент на ячейке
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = self.bounds
    }
    override func prepareForReuse() {
           super.prepareForReuse()
           photoImageView.image = nil
       }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(photoImageView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
