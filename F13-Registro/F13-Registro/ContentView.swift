//
//  ContentView.swift
//  F13-Registro
//
//  Created by Juan Gabriel Gomila Salas on 29/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = RegistrationViewModel()

    var body: some View {
        VStack {
            
            Text("Crear nueva cuenta")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(24)
            
            FormView(fieldName: "Nombre de usuario", fieldValue: $viewModel.username)
            RequirementText(iconName: viewModel.isUsernameLengthValid ? "lock.open" : "lock",
                            iconColor: viewModel.isUsernameLengthValid ? Color.green : Color.red,
                            requirementText: "Mínimo 6 caracteres",
                            isVerified: viewModel.isUsernameLengthValid)
                .padding()
            
            FormView(fieldName: "Contraseña", fieldValue: $viewModel.password, isSecure: true)
            VStack{
                RequirementText(iconName: viewModel.isPasswordLengthValid ? "lock.open" : "lock",
                                iconColor: viewModel.isPasswordLengthValid ? Color.green : Color.red,
                                requirementText: "Mínimo 8 caracteres",
                                isVerified: viewModel.isPasswordLengthValid)
                RequirementText(iconName: viewModel.isPasswordCapitalValid ? "lock.open" : "lock",
                                iconColor: viewModel.isPasswordCapitalValid ? Color.green : Color.red,
                                requirementText: "Por lo menos una mayúscula",
                                isVerified: viewModel.isPasswordCapitalValid)
            }
            .padding()
            
            FormView(fieldName: "Validar Contraseña", fieldValue: $viewModel.passwordValidation, isSecure: true)
            RequirementText(iconName: viewModel.isPasswordConfimedValid ? "lock.open" : "lock",
                            iconColor: viewModel.isPasswordConfimedValid ? Color.green : Color.red,
                            requirementText: "La contraseña de validación debe coincidir con la contraseña elegida.",
                            isVerified: viewModel.isPasswordConfimedValid)
                .padding()
                .padding(.bottom, 48)
            
            Button(action:{
                //TODO: proceder a la siguiente pantalla si todo está OK
            }){
                Text("Registrar cuenta")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red:135/255, green: 240/255, blue: 160/255), Color(red: 135/255, green: 160/255, blue: 240/255)]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
            }
            
            HStack{
                Text("¿Ya tienes cuenta con nosotros?")
                    .font(.system(.callout, design: .rounded))
                    .bold()
                Button(action: {
                    //TODO: llevar a la pantalla de login
                }, label: {
                    Text("Entrar")
                        .font(.system(.callout, design: .rounded))
                        .bold()
                        .foregroundStyle(Color(red: 145/255, green: 160/255, blue: 240/255))
                })
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}


struct RequirementText: View {
    
    var iconName = "lock"
    var iconColor = Color(red:250/255, green: 135/255, blue: 135/255)
    
    var requirementText = ""
    var isVerified = false
    
    var body: some View {
        HStack{
           Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            Text(requirementText)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
                .strikethrough(isVerified)
            
            Spacer()
        }
    }
}


struct FormView: View {
    
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    
    var body: some View {
        VStack{
            if isSecure{
                SecureField(fieldName, text: $fieldValue )
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .padding(.horizontal)
            }else{
                TextField(fieldName, text: $fieldValue )
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 235/255,green: 235/255, blue: 235/255))
                .padding(.horizontal)
            
        }
    }
}



#Preview {
    ContentView()
}

