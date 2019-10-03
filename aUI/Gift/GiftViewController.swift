//
//  GiftViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 10/2/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var GiftCardCollectionView: UICollectionView!
    
    var giftCards: [GiftCardModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GiftCardCollectionView.dataSource = self
        GiftCardCollectionView.delegate = self
        
        GiftCardFunctions.getGiftCards {[weak self] (cards) in
            guard let self = self else { return }
            self.giftCards = cards
            self.GiftCardCollectionView.reloadData()
        }
    }
}


extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "giftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: giftCards[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width / 1.5
        return CGSize(width: width, height: height)
    }
}
