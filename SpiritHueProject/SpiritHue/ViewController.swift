//
//  ViewController.swift
//  SpiritHue
//
//  Created by Jozef Vargas on 3/20/23.
//

import UIKit

class ViewController: UIViewController {
//    let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
    
   
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var textAboveBox: UILabel!
    
    @IBOutlet weak var emotionsTextBox: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var submitTextButton: UIButton!
    
    let myImage = UIImage(named: "imageName")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Setting the z-postion of the elements to avoid overlapping Eelments
        settingsButton.layer.zPosition = 2
        textAboveBox.layer.zPosition = 2
        emotionsTextBox.layer.zPosition = 2
        submitTextButton.layer.zPosition = 2
        backgroundImage.layer.zPosition = 0;
        
        settingsButton.setImage(UIImage.init(named: "widgetIcon"), for: UIControl.State.normal)
        
    }
    
    
    //Responsible for sending the text over
    @IBAction func submitTextButtonPressed(_ sender: UIButton) {
        if let text = emotionsTextBox.text {
            // Do something with the text, for example:
            print("Submitted text: \(text)")
        }
        emotionsTextBox.text = ""
    }

}

