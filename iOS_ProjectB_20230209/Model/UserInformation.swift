//
//  UserInformation.swift
//  iOS_ProjectB_20230209
//
//  Created by 백래훈 on 2023/02/09.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var phoneNumber: String?
    var birthDay: String?
    var date: Date?
    
    var id: String?
    var password: String?
}
