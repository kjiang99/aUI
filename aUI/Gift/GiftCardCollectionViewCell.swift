//
//  GiftCardCollectionViewCell.swift
//  aUI
//
//  Created by Haojun Jiang on 10/2/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit

class GiftCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var giftCardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
        giftCardImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    func setup(giftCardModel: GiftCardModel) {
        giftCardImageView.image = giftCardModel.image
    }
}
