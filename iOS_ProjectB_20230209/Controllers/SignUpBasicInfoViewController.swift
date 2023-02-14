//
//  SignUpBasicInfoViewController.swift
//  iOS_ProjectB_20230209
//
//  Created by 백래훈 on 2023/02/09.
//

import UIKit

class SignUpBasicInfoViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordVerificationTextField: UITextField!
    
    //MARK: imagePicker Closures
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldDelegate()
    }
    
    //MARK: textFieldDelegate Set Method
    func textFieldDelegate() {
        idTextField?.delegate = self
        passwordTextField?.delegate = self
        passwordVerificationTextField?.delegate = self
        
        passwordTextField?.textContentType = .password
        passwordTextField?.isSecureTextEntry = true
        passwordVerificationTextField?.textContentType = .password
        passwordVerificationTextField?.isSecureTextEntry = true
    }
    
    //MARK: - @IBOActions
    @IBAction func selectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
    }
}

//MARK: - Extension
extension SignUpBasicInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //imagePicker Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originImage
        }
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
}

extension SignUpBasicInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if nextButton.isEnabled {
            nextButton.sendActions(for: .editingChanged)
        }
        return true
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        UserInformation.shared.id = idTextField.text
        UserInformation.shared.password = passwordTextField.text
        
        guard let id = idTextField.text, !id.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let passwordVerification = passwordVerificationTextField.text, !passwordVerification.isEmpty,
              let textView = textView.text, !textView.isEmpty else {
            nextButton.isEnabled = false
            return
        }
        nextButton.isEnabled = password == passwordVerification
    }
}
