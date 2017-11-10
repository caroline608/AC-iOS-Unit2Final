//
//  DetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Keshawn Swanston on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    var crayon: Crayon?
    var stepperVal: CGFloat = 1.0{
        didSet {
            alphaLabel.text = String(describing: stepperVal)
            stepper.value = Double(stepperVal)
        }
    }

    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let crayon = crayon else {
            return
        }
        nameLabel.text = crayon.name
        let startColor = UIColor(displayP3Red:CGFloat(crayon.red)/255, green:CGFloat(crayon.green)/255, blue:CGFloat(crayon.blue)/255, alpha: 1.0)
        self.colorView.backgroundColor = startColor
        self.rSlider.value = Float(CGFloat(crayon.red)/255)
        self.gSlider.value = Float(CGFloat(crayon.green)/255)
        self.bSlider.value = Float(CGFloat(crayon.blue)/255)
        redLabel.text = "Red: \(rSlider.value)"
        greenLabel.text = "Green: \(gSlider.value)"
        blueLabel.text = "Blue: \(bSlider.value)"
        stepper.stepValue = 0.10
        stepper.maximumValue = 1.00
        stepper.minimumValue = 0
        stepperVal = CGFloat(stepper.value)
    }
    
  
    //    MARK: - Stepper
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: CGFloat(stepperVal))
        redLabel.text = "Red: \(rSlider.value)"
        greenLabel.text = "Green: \(gSlider.value)"
        blueLabel.text = "Blue: \(bSlider.value)"
        stepperVal = CGFloat(sender.value)

    }
    
    
    //   MARK: - Sliders
    @IBAction func sliders(_ sender: UISlider) {
        self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: CGFloat(stepperVal))
        redLabel.text = "Red: \(rSlider.value)"
        greenLabel.text = "Green: \(gSlider.value)"
        blueLabel.text = "Blue: \(bSlider.value)"
    }
    
    //    MARK: - Reset Button
    
    @IBAction func resetButonPressed(_ sender: UIButton) {
        stepperVal = 0
        self.colorView.backgroundColor = UIColor(displayP3Red:CGFloat((crayon?.red)!)/255, green:CGFloat((crayon?.green)!)/255, blue:CGFloat((crayon?.blue)!)/255, alpha: 1.0)
        self.rSlider.value = Float(CGFloat((crayon?.red)!)/255)
        self.gSlider.value = Float(CGFloat((crayon?.green)!)/255)
        self.bSlider.value = Float(CGFloat((crayon?.blue)!)/255)
        redLabel.text = "Red: \(rSlider.value)"
        greenLabel.text = "Green: \(gSlider.value)"
        blueLabel.text = "Blue: \(bSlider.value)"
        stepperVal = CGFloat(stepper.value)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
