//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Chris Hand on 9/4/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        self.errorLabel.isHidden = true
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please sign in with biometrics") { success, signInError in
                if !success {
                    DispatchQueue.main.async {
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "Could not sign in."
                    }
                    
                    return
                }
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toSignedInVC", sender: nil)
                }
                
            }
        }
    }
}

