//
//  SignUpVC.swift
//  TapCash
//
//  Created by Ahmed Alaa on 09/05/2023.
//

import UIKit

class SignUpVC: UIViewController {

    
    // Mark: - Outlets.
    @IBOutlet weak var backGround1: UIImageView!
    @IBOutlet weak var backGround2: UIImageView!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passworedLabel: UILabel!
    @IBOutlet weak var phoneNumberLABEL: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworedTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    
    // Mark: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sign Up Screen"


    }
    // Mark: - Actions.
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        if IsDateEnterd() {
            goToLogInVC()
        }
    }
    @IBAction func pasworedChanged(_ sender: UITextField) {
        let password = sender.text ?? ""
            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)

            if passwordPredicate.evaluate(with: password) {
            } else {
                print("Password does not meet security requirements")
            }
    }
    
    @IBAction func showPassworedBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passworedTextField.isSecureTextEntry = !sender.isSelected
       }

    }
    
    

// MARK: -Private Methods
extension SignUpVC {
    private func goToLogInVC(){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let logInVC: LogInVC = mainStoryboard.instantiateViewController(withIdentifier: Views.logInVC ) as! LogInVC
        let user: User = User(firstName: firstNameTextField.text ?? "",
                              lastName: lastNameTextField.text ?? "",
                              email: emailTextField.text ?? "",
                              passwored: passworedTextField.text ?? "",
                              phoneNumber: phoneNumberTextField.text ?? "")
        UserDefualtManger.shared.convertUserIntoData(user)
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    
    private func IsDateEnterd() -> Bool {
        guard firstNameTextField.text != "" else {
            print("Please enter name!")
            return false
        }
        guard lastNameTextField.text != "" else {
            print("Please enter phone1")
            return false
        }
        guard emailTextField.text != "" else {
            print("Please enter email!")
            return false
        }
        guard passworedTextField.text != "" else {
            print("Please enter passwored!")
            return false
        }
        guard phoneNumberTextField.text != "" else {
            print("Please enter address!")
            return false
        }
        return true
    }
    
        }


