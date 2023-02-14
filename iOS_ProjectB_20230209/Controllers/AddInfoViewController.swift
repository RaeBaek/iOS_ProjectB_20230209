//
//  AddInfoViewController.swift
//  iOS_ProjectB_20230209
//
//  Created by 백래훈 on 2023/02/09.
//

import UIKit

class AddInfoViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var beforeButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            signUpButton.isEnabled = false
        }
    }
    
    // dateFormatter Closure
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInfoValue()
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: .valueChanged)
//        self.phoneNumberTextField.delegate = self
        self.phoneNumberTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func userInfoValue() {
        self.phoneNumberTextField.text = UserInformation.shared.phoneNumber
        self.birthDayLabel.text = UserInformation.shared.birthDay
        self.datePicker.date = UserInformation.shared.date ?? Date()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        UserInformation.shared.phoneNumber = phoneNumberTextField.text
        
        if !(phoneNumberTextField.text?.isEmpty ?? false) && !(birthDayLabel.text?.isEmpty ?? false) {
            self.signUpButton.isEnabled = true
        } else {
            self.signUpButton.isEnabled = false
        }
    }
    
    //MARK: @IBActions
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.birthDayLabel.text = dateString
        UserInformation.shared.birthDay = dateString
        UserInformation.shared.date = date
        
        if !(phoneNumberTextField.text?.isEmpty ?? false) && !(birthDayLabel.text?.isEmpty ?? false) {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
        
    }
    
    @IBAction func popToRootButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.birthDay = nil
        UserInformation.shared.date = nil
    }
    
    @IBAction func popButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
//        self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true)
        // rootViewController로 이동 후 다시 회원가입 버튼을 누르면
        // 번호와 생일이 싱글톤 정보에 남기 때문에
        // nil 값을 할당하여 임시적으로 정보 제거
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.birthDay = nil
    }
}

extension AddInfoViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if signUpButton.isEnabled {
//            signUpButton.sendActions(for: .touchUpInside)
//        }
//        return true
//    }
//
//    @IBAction func textFieldDidChange(_ sender: UITextField) {
//        UserInformation.shared.phoneNumber = phoneNumberTextField.text
//
//        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty,
//              let birthday = birthdayLabel.text, !birthday.isEmpty else {
//            signUpButton.isEnabled = false
//            return
//        }
//        signUpButton.isEnabled = true
//    }
    
}
