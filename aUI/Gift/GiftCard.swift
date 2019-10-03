//
//  GiftCard.swift
//  aUI
//
//  Created by Haojun Jiang on 10/2/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import Foundation
import UIKit

struct GiftCardModel {
    var id: UUID
    var description: String
    var image: UIImage?
}


//
//  GiftCardFunctions.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/10/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import Foundation

class GiftCardFunctions {
    static func getGiftCards(completion: @escaping ([GiftCardModel]) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            var giftCardModels = [GiftCardModel]()
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Seasonal Gift Card 1", image: UIImage (named: "SeasonalGiftCard1")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Seasonal Gift Card 2", image: UIImage (named: "SeasonalGiftCard2")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Seasonal Gift Card 3", image: UIImage (named: "SeasonalGiftCard3")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Seasonal Gift Card 4", image: UIImage (named: "SeasonalGiftCard4")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Seasonal Gift Card 5", image: UIImage (named: "SeasonalGiftCard5")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Seasonal Gift Card 6", image: UIImage (named: "SeasonalGiftCard6")))

            DispatchQueue.main.async {
                completion(giftCardModels)
            }
        }
    }
    
    static func getThankYouGiftCards(completion: @escaping ([GiftCardModel]) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            var giftCardModels = [GiftCardModel]()
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 1", image: UIImage (named: "ThankYouGiftCard1")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 2", image: UIImage (named: "ThankYouGiftCard2")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 3", image: UIImage (named: "ThankYouGiftCard3")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 4", image: UIImage (named: "ThankYouGiftCard4")))
            
            DispatchQueue.main.async {
                completion(giftCardModels)
            }
        }
    }
}
