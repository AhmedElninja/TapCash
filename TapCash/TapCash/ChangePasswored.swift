//
//  ChangePasswored.swift
//  TapCash
//
//  Created by Ahmed Alaa on 10/05/2023.
//

import UIKit

class ChangePasswored: UIViewController {

    //Mark: - Outlets.
    
    @IBOutlet weak var passworedLabel: UILabel!
    @IBOutlet weak var confirmPassworedLabel: UILabel!
    
    @IBOutlet weak var passworedTextField: UITextField!
    @IBOutlet weak var confirmPassworedTextField: UITextField!
    
    //Mark: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //Mark: - Actions.
    @IBAction func showPassworedBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passworedTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func confirmPassworedBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passworedTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        guard let password = passworedTextField.text,
            let confirmPassword = confirmPassworedTextField.text,
                password == confirmPassword else {
                    // Show error message if password and confirm password fields don't match
                    let alert = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }

                // Show success message
                let alert = UIAlertController(title: "Success", message: "Password changed successfully", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
    }
    

