//
//  RegistrationViewModel.swift
//  F13-Registro
//
//  Created by Juan Gabriel Gomila Salas on 29/9/23.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject{
    //Entradas
    @Published var username = ""
    @Published var password = ""
    @Published var passwordValidation = ""
    
    //Salidas o Validaciones
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalValid = false
    @Published var isPasswordConfimedValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(){
        $username
            .receive(on: RunLoop.main)
            .map { username in
                return username.count >= 6
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]" //dígitos = [0-9]
                if let _ = password.range(of: pattern, options: .regularExpression){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordValidation)
            .receive(on: RunLoop.main)
            .map { (password1, password2) in
                return !password1.isEmpty && !password2.isEmpty && (password1 == password2)
            }
            .assign(to: \.isPasswordConfimedValid, on: self)
            .store(in: &cancellableSet)
        
    }
}
