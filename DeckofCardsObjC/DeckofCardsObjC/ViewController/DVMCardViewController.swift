//
//  DVMCardViewController.swift
//  DeckofCardsObjC
//
//  Created by Alex Kennedy on 9/29/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import UIKit

class DVMCardViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var suitAndValueLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    //MARK: - properties
    var card: DVMCard?
    var image: UIImage?
    
    
    //MARK: - lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    //MARK: - actions
    @IBAction func cardButtonTapped(_ sender: Any) {
        fetchCard()
    }
    
    func updateViews() {
        guard let card = card, let image = image else { return }
        suitAndValueLabel.text = "\(card.value) of \(card.suit)"
        cardImage.image = image
    }
    
    
    func fetchCard() {
        CardController.drawANewCard { (cards) in
            if let card = cards {
                CardController.fetchCardImage(card) { (image) in
                    DispatchQueue.main.async {
                        self.card = card
                        self.image = image
                        self.updateViews()
                    }
                }
            }
        }
    }
    

}
