//
//  LogInVC.swift
//  TapCash
//
//  Created by Ahmed Alaa on 09/05/2023.
//

import UIKit

class LogInVC: UIViewController {

    // Mark: - Outlets.
    @IBOutlet weak var backGroundColor1: UIImageView!
    @IBOutlet weak var backGroundColor2: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passworedLabel: UILabel!
    @IBOutlet weak var DontHaveAnAccountLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworedTextField: UITextField!
    
    //MARK: - Propreties.
    var email: String = ""
    var passwored: String = ""
    
    
    // Mark: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = UserDefualtManger.shared.convertFromDataIntoUser() {
            self.email = user.email
            self.passwored = user.passwored
        }
    }

    // Mark: - Actions.
    @IBAction func ForgetPassworedBtnTapped(_ sender: UIButton) {
        goToForgetPasswored()
    }
    @IBAction func SignInBtnTapped(_ sender: UIButton) {
        if IsDateEnterd() {
            if isDataCorrect() {
           //     goToProfileVC()
            }
        }
    }
    @IBAction func SignUpBtnTapped(_ sender: UIButton) {
        goToSignUpVC()
    }
    
    @IBAction func showPassworedBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passworedTextField.isSecureTextEntry = !sender.isSelected
    }
}



//MARK: - Private Methods.
extension LogInVC {
    /*
    private func goToProfileVC() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let profileVC: ProfileVC = mainStoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    */
    private func isDataCorrect() -> Bool {
        if email == emailTextField.text && passwored == passworedTextField.text {
            return true
        } else {
            return false
        }
    }
    private func IsDateEnterd() -> Bool {
        guard emailTextField.text != "" else {
            print("Please enter email!")
            return false
        }
        guard passworedTextField.text != "" else {
            print("Please enter passwored!")
            return false
        }
        return true
    }
    private func goToSignUpVC(){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let signupVc: SignUpVC = mainStoryboard.instantiateViewController(withIdentifier: Views.signUpVC ) as! SignUpVC
        self.navigationController?.pushViewController(signupVc, animated: true)
    }
    private func goToForgetPasswored(){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let forgetPasswored: ForgetPasswored = mainStoryboard.instantiateViewController(withIdentifier: Views.forgetpasswored ) as! ForgetPasswored
        self.navigationController?.pushViewController(forgetPasswored, animated: true)
    }
}

    

