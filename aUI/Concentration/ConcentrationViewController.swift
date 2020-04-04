//
//  ConcentrationViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 1/19/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    /* Same as above, just use lazy with closure
    lazy var numberOfPairsOfCards: Int  = {
        return (cardButtons.count + 1) / 2
    }()
     */
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flips: \(flipCount)"
        }
    }

    
    @IBOutlet private var cardButtons: [UIButton]!

    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            if !game.cards[cardIndex].isMatched,  !game.cards[cardIndex].isFaceUp  {
                flipCount += 1                
                game.chooseCard(at: cardIndex)
                updateViewFromModel()
                //print (game.cards[cardIndex].hashValue)
                //flipCard(withEmoji: emojiChoices[cardIndex], on: sender)
            }
        } else {
            print ("Chosen card was not in the cardButtons")
        }
    }
    
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
    private func updateViewFromModel () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal);
                button.backgroundColor = card.isMatched ?  UIColor.clear : UIColor.orange
            }
        }
    }
    
    
    //private var emojiChoices = ["👻", "🎃", "🙇🏻‍♂️", "💁🏻‍♀️","💩","💀","👽","🤖","☃️"]
        //emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
    private var emojiChoices = "👻🎃🙇🏻‍♂️💁🏻‍♀️💩💀👽🤖☃️"
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil,  emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
//
//    func flipCard (withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControlState.normal);
//            button.backgroundColor = UIColor.orange
//        } else {
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = UIColor.white
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


