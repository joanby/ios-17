//
//  PaymentFormViewModel.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 13/12/23.
//

import Foundation
import Combine

class PaymentFormViewModel : ObservableObject {
    
    //MARK: Datos del Formulario
    @Published var name = ""
    @Published var location = ""
    @Published var amount = ""
    @Published var type = PaymentCategory.expense
    @Published var date = Date.today
    @Published var notes = ""
    
    //MARK: Resultado de Validación
    @Published var isNameValid = false
    @Published var isAmountValid = true
    @Published var isNoteValid = true
    @Published var isFormValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    init(payment: PaymentRecord?){
        
        self.name = payment?.name ?? ""
        self.location = payment?.location ?? ""
        self.amount = "\(payment?.amount ?? 0.0)"
        self.notes = payment?.notes ?? ""
        self.type = payment?.type ?? .expense
        self.date = payment?.date ?? Date.today
        
        
        self.$name
            .receive(on: RunLoop.main)
            .map { name in
                return name.count > 3
            }
            .assign(to: \.isNameValid, on: self)
            .store(in: &cancellableSet)
        
        self.$amount
            .receive(on: RunLoop.main)
            .map { amount in
                guard let validAmount = Double(amount) else{
                    return false
                }
                return validAmount > 0
            }
            .assign(to: \.isAmountValid, on: self)
            .store(in: &cancellableSet)
        
        self.$notes
            .receive(on: RunLoop.main)
            .map { notes in
                return notes.count < 150
            }
            .assign(to: \.isNoteValid, on: self)
            .store(in: &cancellableSet)
        
        
        Publishers.CombineLatest3(self.$isNameValid, self.$isAmountValid, self.$isNoteValid)
            .receive(on: RunLoop.main)
            .map{ (isNameValid, isAmountValid, isNoteValid) in
                return isNameValid && isAmountValid && isNoteValid
            }
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellableSet)

    }
    
}
