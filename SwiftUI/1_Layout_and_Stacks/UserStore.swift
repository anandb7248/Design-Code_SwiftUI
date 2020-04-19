//
//  UserStore.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/19/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
}
