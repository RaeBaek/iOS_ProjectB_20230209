//
//  ViewController.swift
//  iOS_ProjectB_20230209
//
//  Created by 백래훈 on 2023/02/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextFieldSet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.userInfoValue()
    }
    
    func userInfoValue() {
        self.idTextField.text = UserInformation.shared.id
    }
    
    func passwordTextFieldSet() {
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
    }
    
    //MARK: @IBActions
//    @IBAction func signUpButton(_ sender: UIButton) {
//        let nextViewController = SignUpBasicInfoViewController()
//        nextViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//        self.present(nextViewController, animated: true, completion: nil)
//        print("yes")
//    }
}

