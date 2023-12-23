//
//  PaymentFormView.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 11/12/23.
//

import SwiftUI

struct PaymentFormView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @ObservedObject private var paymentFormVM : PaymentFormViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var payment: PaymentRecord?
    
    init(payment: PaymentRecord? = nil) {
        self.payment = payment
        self.paymentFormVM = PaymentFormViewModel(payment: payment)
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0, content: {
                //Título
                HStack(alignment: .lastTextBaseline, content: {
                    Text("Nuevo Registro")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "multiply")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                })
                
                //Validaciones
                Group{
                    if !self.paymentFormVM.isNameValid{
                        ValidationErrorText(text: "Introduce un nombre válido para el registro")
                    }
                    
                    if !self.paymentFormVM.isAmountValid {
                        ValidationErrorText(text: "Introduce una cantidad positiva")
                    }
                    
                    if !self.paymentFormVM.isNoteValid {
                        ValidationErrorText(text: "Las notas no pueden superar los 150 caracteres")
                    }
                }
                
                //Nombre
                FormTextField(name: "Nombre", placeholder: "Introduce tu registro", value: self.$paymentFormVM.name)
                    .padding(.top)
                
                //Tipo de Registro
                VStack(alignment: .leading, content: {
                    Text("Tipo de Registro")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.vertical, 12)
                    
                    HStack(spacing: 0){
                        Button(action:{
                            self.paymentFormVM.type = .income
                        }){
                            Text("Ingreso")
                            .font(.headline)
                            .foregroundStyle(self.paymentFormVM.type == .income ? Color.white : Color.primary)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                        .background(self.paymentFormVM.type == .income ?  Color("Income") : Color("NoActive"))
                        
                        
                        
                        Button(action:{
                            self.paymentFormVM.type = .expense
                        }){
                            Text("Gasto")
                            .font(.headline)
                            .foregroundStyle(self.paymentFormVM.type == .expense ? Color.white : Color.primary)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                        .background(self.paymentFormVM.type == .expense ? Color("Expense") : Color("NoActive"))
                    }
                    .border(Color("Border"), width: 1.0)
                    
                    
                    //Fecha y Cantidad
                    HStack{
                        FormDateField(name: "Fecha", value: self.$paymentFormVM.date)
                        FormTextField(name: "Cantidad (en €)", placeholder: "0.0", value: self.$paymentFormVM.amount)
                    }
                    
                    //Dónde?
                    FormTextField(name: "Ubicación (opcional)", placeholder: "¿Dónde fue la compra?", value: self.$paymentFormVM.location)
                    
                    //Notas
                    FormTextEditor(name: "Notas (opcional)", value: self.$paymentFormVM.notes)
                    
                    //Guardar
                    Button(action: {
                        save()
                        dismiss()
                    }) {
                        Text("Guardar")
                            .opacity(self.paymentFormVM.isFormValid ? 1.0 : 0.5)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(24)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.teal.opacity(self.paymentFormVM.isFormValid ? 1.0 : 0.5))
                            .cornerRadius(12.0)
                    }
                    .padding()
                    .disabled(!self.paymentFormVM.isFormValid)
                })
            })
            .padding()
        }
        .keyboardAdapter()
    }
    
    
    private func save(){
        let payment = PaymentRecord(date: self.paymentFormVM.date,
                                    name: self.paymentFormVM.name,
                                    location: self.paymentFormVM.location,
                                    amount: Double(self.paymentFormVM.amount)!,
                                    notes: self.paymentFormVM.notes,
                                    type: self.paymentFormVM.type)
        
        if let p = self.payment{
            self.modelContext.delete(p)
        }
        
        self.modelContext.insert(payment)
    }
}

#Preview {
    PaymentFormView()
}


struct FormTextField: View {
    
    let name: String
    var placeholder: String
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)

            TextField(self.placeholder, text: self.$value)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
        })
    }
}


#Preview ("Campo de Texto"){
    FormTextField(name: "Test", placeholder: "Introduce tu valor", value: .constant(""))
}



struct FormDateField: View {
    
    let name: String
    
    @Binding var value: Date
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)

            DatePicker("", selection: self.$value, displayedComponents: .date)
                .accentColor(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
                .labelsHidden()
        })
    }
}

#Preview ("Campo de Fecha"){
    FormDateField(name: "Fecha", value: .constant(Date()))
}


struct FormTextEditor: View {
    
    let name: String
    var height: CGFloat = 100.0
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)

            TextEditor(text: self.$value)
                .frame(minHeight: self.height)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
        })
    }
}

#Preview ("Campo de Texto Largo"){
    FormTextEditor(name: "Texto", value: .constant(""))
}

struct ValidationErrorText: View {
    var iconName = "info.circle"
    var iconColor = Color(red: 250/255, green: 128/255, blue: 128/255)
    
    var text = ""
    
    var body: some View {
        HStack{
            Image(systemName: self.iconName)
                .foregroundStyle(self.iconColor)
            Text(self.text)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
            Spacer()
        }
    }
}


#Preview("Error de validación"){
    ValidationErrorText(text: "El importe no puede ser negativo")
}
