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
    
    let dataProcessed = DataParser()
    
    

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
        let dataProcessed = DataParser()
        //checks if emotionsTextBox.text is not nil and assigns the unwrapped text value to the text constant.
        if let text = emotionsTextBox.text {
            //This is another if let statement that uses the createPayload(from:) function of the DataParser class to create a JSON-encoded Data object from the text constant. The if let statement checks if createPayload(from:) returns a non-nil value (i.e., the encoding was successful) and assigns the resulting data object to the data constant.
            if let data = dataProcessed.createPayload(from: text) {
                // Do something with the data, for example:
                print("Submitted text: \(text)")
                print("JSON data: \(String(data: data, encoding: .utf8)!)")
                
                fetchEmotion(text: text) { emotion, error in
                    DispatchQueue.main.async {
                        if let error = error {
                            print("Error:", error.localizedDescription)
                        } else if let emotion = emotion {
                            print("Emotion:", emotion)
                        }
                    }
                }

            }
        }
        emotionsTextBox.text = ""
    }
    
    


}

