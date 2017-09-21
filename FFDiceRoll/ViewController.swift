//
//  ViewController.swift
//  FFDiceRoll
//
//  Created by Nicholas Nuing on 20/09/2017.
//  Copyright © 2017 otakrosak. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var diceUIPicker: UIPickerView!
    @IBOutlet weak var rollDiceResult: ShakingDiceResult!
    @IBOutlet weak var selectOneDie: UIButton!
    @IBOutlet weak var selectTwoDice: UIButton!

    var pickerData: [String] = [String]()
    var diceResult: GKRandomDistribution?
    var pickerRow: Int? = 0
    var ds: Int? = 0
    var dr: Int? = 0
    var noOfDice: Int? = 1
    var diceSum: Int? = 0
    var oneHighlighted:Bool = false
    var twoHighlighted:Bool = false
	
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerRow = row
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let attributedString = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName : UIColor(red:1.00, green:0.40, blue:0.40, alpha:1.0)])
        return attributedString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.diceUIPicker.delegate = self
        self.diceUIPicker.dataSource = self
        
        pickerData = [
            "6 Sided",
            "10 Sided",
            "20 Sided"
        ]
        
        selectOneDie.backgroundColor = UIColor(red:0.60, green: 0.60, blue:0.60, alpha:1.0)
    }
	
    // lock orientation
    override var shouldAutorotate: Bool {
        return false
    }

    // lock orientation
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - Button Actions

    @IBAction func clickChangeState(_ sender: UIButton) {
        // need to darken the background color of the button
        ButtonStates.buttonState(dice1: selectOneDie, dice2: selectTwoDice)
        
        // set the buttons bg color
        selectOneDie.backgroundColor = UIColor(red:0.60, green: 0.60, blue:0.60, alpha:1.0)
        selectTwoDice.backgroundColor = UIColor(red:0.80, green: 0.80, blue:0.80, alpha:1.0)
        
        // set the bool
        oneHighlighted = true
        twoHighlighted = false
        print(twoHighlighted)
    }
	
    @IBAction func twoDice(_ sender: UIButton) {
        // need to darken the background color of the button
        ButtonStates.buttonState(dice1: selectOneDie, dice2: selectTwoDice)

        // set the buttons bg color
        selectOneDie.backgroundColor = UIColor(red:0.80, green: 0.80, blue:0.80, alpha:1.0)
        selectTwoDice.backgroundColor = UIColor(red:0.60, green: 0.60, blue:0.60, alpha:1.0)
        
        // set the bool
        oneHighlighted = false
        twoHighlighted = true
        print(twoHighlighted)
    }
    // TODO: Move all the States and Color change to another function
    
    // MARK: - Dice Roll
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("You shook me!")
        let pickerResult = UInt32(pickerRow!)
        
        // 1. Get the number of dice rolled
        if twoHighlighted {
            noOfDice = 2
        } else {
            noOfDice = 1
        }
        
        // 2. Do a while loop to get the total sum
        // of the dice roll
        while noOfDice! > 0 {
            switch pickerResult {
                case 0:
                    diceResult = GKRandomDistribution.d6()
                case 1:
                    diceResult = GKRandomDistribution.init(forDieWithSideCount: 10)
                case 2:
                    diceResult = GKRandomDistribution.d20()
                default:
                    diceResult = GKRandomDistribution.d6()
            } // endswitch
            
            dr = Int((diceResult?.nextInt())!)
            ds = Int(dr!) + Int(ds!)
            noOfDice = noOfDice! - 1
        } // endwhile
        
        
        let dc = String(describing: Int((ds)!))
        rollDiceResult.text = dc
        ds = 0
    }

    @IBAction func rollDiceAction(_ sender: Any) {
        let pickerResult = UInt32(pickerRow!)
			
        // 1. Get the number of dice rolled
        if twoHighlighted {
            noOfDice = 2
        } else {
            noOfDice = 1
        }
    
        // 2. Do a while loop to get the total sum
        // of the dice roll
        while noOfDice! > 0 {
            switch pickerResult {
                case 0:
                    diceResult = GKRandomDistribution.d6()
                case 1:
                    diceResult = GKRandomDistribution.init(forDieWithSideCount: 10)
                case 2:
                    diceResult = GKRandomDistribution.d20()
                default:
                    diceResult = GKRandomDistribution.d6()
            } // endswitch

            dr = Int((diceResult?.nextInt())!)
            ds = Int(dr!) + Int(ds!)
            noOfDice = noOfDice! - 1
        } // endwhile
    
    
        let dc = String(describing: Int((ds)!))
        rollDiceResult.text = dc
        rollDiceResult.shake() // shake the label!
        ds = 0 // reset the ds variable
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}

