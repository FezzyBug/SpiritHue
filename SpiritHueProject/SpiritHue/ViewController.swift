//
//  ViewController.swift
//  SpiritHue
//
//  Created by Jozef Vargas on 3/20/23.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
//    let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
        
   
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var textAboveBox: UILabel!
    
    @IBOutlet weak var emotionsTextBox: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var submitTextButton: UIButton!
    
    
    @IBOutlet weak var testButton: UIButton!
    
    var newStrings = ["New string 1", "New string 2", "New string 3"]
    
   
    
    
    
    let dataProcessed = DataParser()
    
//    func scheduleAlert() {
//        let alertDelay = 10.0 // time in seconds before alert appears
//        Timer.scheduledTimer(withTimeInterval: alertDelay, repeats: false) { _ in
//            let newStrings = ["New string 1", "New string 2", "New string 3"]
//            let demoTest = DemoTest(textBlocks: newStrings)
//
//            // If you use a storyboard, make sure to remove the DemoTest scene from the storyboard.
//            // The custom initializer we created does not work with storyboard scenes.
//
//            self.present(demoTest, animated: true)
//        }
//    }
    

    
    func scheduleAlert() {
        let alertDelay = 10.0 // time in seconds before alert appears
        Timer.scheduledTimer(withTimeInterval: alertDelay, repeats: false) { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let demoTest = storyboard.instantiateViewController(withIdentifier: "DemoTest") as? DemoTest {
//                let newStrings = ["New string 1", "New string 2", "New string 3"]
                demoTest.newTextBlocks = self.newStrings
                self.present(demoTest, animated: true)
            }
        }
    }



    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Setting the z-postion of the elements to avoid overlapping Eelments
        textAboveBox.layer.zPosition = 2
        emotionsTextBox.layer.zPosition = 2
        submitTextButton.layer.zPosition = 2
        testButton.layer.zPosition = 2
        backgroundImage.layer.zPosition = 0;
        
        self.scheduleAlert()
        
        
        // Load the image
            guard let image = UIImage(named: "widgetIcon.png") else {
                fatalError("Failed to load image")
            }
            
        // Scale the image to fit the button
            let buttonSize = CGSize(width: 80, height: 80)
            UIGraphicsBeginImageContext(buttonSize)
            image.draw(in: CGRect(origin: .zero, size: buttonSize))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // Set the image for the button
           testButton.setImage(scaledImage, for: .normal)
            
            // Set the content mode of the image view to scaleAspectFit
            backgroundImage.contentMode = .scaleAspectFit
            
            
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
                            self.newStrings.append("Animal")
                        }
                    }
    
                }

            }
        }
        emotionsTextBox.text = ""
    }
    
    


}

