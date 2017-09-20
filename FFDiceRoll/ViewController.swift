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
    var diceResult: GKRandomDistribution?
    var pickerRow: Int? = 0
    var ds: Int? = 0
    
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
        // print(row)
        pickerRow = row
    }
    
    @IBOutlet weak var diceUIPicker: UIPickerView!
    @IBOutlet weak var rollDiceResult: UILabel!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.diceUIPicker.delegate = self
        self.diceUIPicker.dataSource = self
        
        pickerData = [
            "6 Sided",
            "10 Sided",
            "20 Sided"
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollDiceAction(_ sender: Any) {
        let pickerResult = UInt32(pickerRow!)
        
        switch pickerResult {
            case 0:
                diceResult = GKRandomDistribution.d6()
            case 1:
                diceResult = GKRandomDistribution.init(forDieWithSideCount: 10)
            case 2:
                diceResult = GKRandomDistribution.d20()
            default: ds = 6
        }
        
        let dc = String(describing: Int((diceResult?.nextInt())!))
        rollDiceResult.text = dc
    }

}

