//
//  ContentView.swift
//  F19-Prestamos
//
//  Created by Juan Gabriel Gomila Salas on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanFactory = LoanFactory()
    
    @State private var showFilter = false
    @State private var maxAmount = 1000.0
    
    var body: some View {
        NavigationStack{
            VStack{
                if showFilter {
                    FilterView(maxLoan: self.$maxAmount)
                        .transition(.opacity)
                }
                
                
                List(self.loanFactory.loans){ loan in
                    CellView(loan: loan)
                        .padding(.vertical, 8)
                }
                .navigationTitle("Préstamos de Kiva")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            withAnimation(.linear){
                                self.showFilter.toggle()
                                self.loanFactory.filterLoans(maxAmout: Int(self.maxAmount))
                            }
                        } label: {
                            Image(systemName: "gear")
                                .font(.title)
                                .foregroundStyle(.teal)
                                .padding(16)
                                
                        }
                    }
                }
            }
        }
        .task {
            self.loanFactory.fetchFromApi()
        }
        
    }
}

#Preview {
    ContentView()
}
