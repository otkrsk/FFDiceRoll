//
//  ButtonStates.swift
//  FFDiceRoll
//
//  Created by Nicholas Nuing on 21/09/2017.
//  Copyright © 2017 otakrosak. All rights reserved.
//

import UIKit

class ButtonStates: NSObject {
    
    /**
        Function to change the Buttons State.
     
        - parameter dice1: UIButton object.
     
        - parameter dice2: UIButton object.
    */
    class func buttonState(dice1: UIButton, dice2: UIButton) {
        if dice1.isHighlighted {
            dice1.isHighlighted = false
            dice2.isHighlighted = true
        } else {
            dice1.isHighlighted = true
            dice2.isHighlighted = false
        }
    }
    
    /**
        Function to change the Button Color.

        - parameter dice: UIButton object.
     */
    class func buttonColor(dice: UIButton) {
        dice.backgroundColor = UIColor(red:0.80, green: 0.50, blue:0.50, alpha:1.0)
    }

}
