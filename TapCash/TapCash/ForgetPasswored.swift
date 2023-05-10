//
//  ForgetPasswored.swift
//  TapCash
//
//  Created by Ahmed Alaa on 10/05/2023.
//

import UIKit

class ForgetPasswored: UIViewController {
    
    // Mark: - Outlets.
    @IBOutlet weak var forgetPassworedImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    
    // Mark: - Actions.
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Mark: - Actions.
    @IBAction func sendBtnTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, isValidEmail(email) || !phoneNumberTextField.text!.isEmpty else {
            showAlert(withTitle: "Invalid Input", message: "Please enter a valid email or phone number.")
            return
        }
        
    }
    // Mark: - Private Func.
    private func isValidEmail(_ email: String) -> Bool {
            // Validate the email format
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        
        private func showAlert(withTitle title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
}
