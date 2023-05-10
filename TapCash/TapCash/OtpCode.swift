//
//  OtpCode.swift
//  TapCash
//
//  Created by Ahmed Alaa on 10/05/2023.
//

import UIKit

class OtpCode: UIViewController, UITextFieldDelegate {
    
    // Mark: - Outlets.
    
    @IBOutlet weak var otpImage: UIImageView!
    @IBOutlet weak var firstOtpTextField: UITextField!
    @IBOutlet weak var secondOtpTextField: UITextField!
    @IBOutlet weak var thirdOtpTextField: UITextField!
    @IBOutlet weak var forthOtpTetField: UITextField!
    
    
    // Mark: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstOtpTextField.delegate = self
        secondOtpTextField.delegate = self
        thirdOtpTextField.delegate = self
        forthOtpTetField.delegate = self
        
        let borderColor = UIColor(hex: "#06C258FF")
        [firstOtpTextField, secondOtpTextField, thirdOtpTextField, forthOtpTetField].forEach { textField in
      textField.layer.cornerRadius = textField.frame.height / 2
      textField.layer.borderWidth = 1
      textField.layer.borderColor = borderColor?.cgColor
      }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            guard let range = Range(range, in: currentText) else { return false }
            let newText = currentText.replacingCharacters(in: range, with: string)
            
            if newText.count == 1 {
                // Move focus to the next text field
                switch textField {
                case firstOtpTextField:
                    secondOtpTextField.becomeFirstResponder()
                case secondOtpTextField:
                    thirdOtpTextField.becomeFirstResponder()
                case thirdOtpTextField:
                    forthOtpTetField.becomeFirstResponder()
                case forthOtpTetField:
                    textField.resignFirstResponder()
                default:
                    break
                }
            } else if newText.count == 0 {
                // Move focus to the previous text field if current text field is empty
                switch textField {
                case secondOtpTextField:
                    firstOtpTextField.becomeFirstResponder()
                case thirdOtpTextField:
                    secondOtpTextField.becomeFirstResponder()
                case forthOtpTetField:
                    thirdOtpTextField.becomeFirstResponder()
                default:
                    break
                }
            }
            
            return true
        }

    // Mark: - Actions.
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        goToLogInVC()
    }
    
    //Mark: - Private Methods.
    private func goToLogInVC(){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let logInVC: LogInVC = mainStoryboard.instantiateViewController(withIdentifier: Views.logInVC ) as! LogInVC
            print("OTP confirmed!")
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    
}
    //Mark: - UiColor extension.
    extension UIColor {
           convenience init?(hex: String) {
            let r, g, b, a: CGFloat
        
            if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
               let scanner = Scanner(string: hexColor)
               var hexNumber: UInt64 = 0
                
               if scanner.scanHexInt64(&hexNumber) {
                 r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                 g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                 b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                 a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                 self.init(red: r, green: g, blue: b, alpha: a)
                      return
                }
            }
        }
        return nil
    }
}
