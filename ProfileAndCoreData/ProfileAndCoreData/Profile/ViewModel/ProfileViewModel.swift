//
//  File.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/22.
//

import Foundation

class ProfileViewModel {
    var userProfile: UserProfile
    
    init(userProfile: UserProfile) {
        self.userProfile = userProfile
    }
    
    var userName: String {
        return userProfile.userName
    }
    
    var userAge: String {
        return "\(userProfile.userAge)"
    }
}
