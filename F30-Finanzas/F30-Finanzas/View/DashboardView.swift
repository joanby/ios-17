//
//  ContentView.swift
//  F30-Finanzas
//
//  Created by Juan Gabriel Gomila Salas on 11/12/23.
//

import SwiftUI
import SwiftData


enum TransactionType {
    case all
    case income
    case expense
}

struct DashboardView: View {
  
    @Environment(\.modelContext) var modelContext
    
    @State private var showPaymentDetails = false
    @State private var editPaymentDetails = false
    
    @State private var selectedPaymentRecord : PaymentRecord?
    
    @State private var transactionType: TransactionType = .all
    
    @Query var paymentRecords : [PaymentRecord]
    
    
    private var totalIncome: Double{
        let total = self.paymentRecords
            .filter {
                $0.type == .income
            }.reduce(0){
                $0+$1.amount
            }
        return total
    }
    private var totalExpense: Double{
        let total = self.paymentRecords
            .filter{
                $0.type == .expense
            }.reduce(0) {
                $0 + $1.amount
            }
        return total
    }
    
    private var totalBalance: Double{
        return self.totalIncome - self.totalExpense
    }
    
    private var paymentRecordsForView: [PaymentRecord]{
        switch self.transactionType {
        case .all:
            return self.paymentRecords
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        case .income:
            return self.paymentRecords
                .filter { $0.type == .income }
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        case .expense:
            return self.paymentRecords
                .filter { $0.type == .expense }
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        }
    }
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                MenuBar() {
                    PaymentFormView()
                }
                .listRowInsets(EdgeInsets())
                
                VStack{
                    TotalBalanceCard(balance: self.totalBalance)
                        .padding(.horizontal)
                    
                    HStack(spacing: 16){
                        TotalIncomeCard(balance: self.totalIncome)
                        TotalExpenseCard(balance: self.totalExpense)
                    }
                    .padding(.horizontal)
                    
                    RecordHeader(transactionType: self.$transactionType)
                        .padding(.all)
                }
                
                
                ForEach(self.paymentRecordsForView) { record in
                    RecordCellView(record: record)
                        .onTapGesture {
                            self.showPaymentDetails = true
                            self.selectedPaymentRecord = record
                        }
                        .contextMenu{
                            Button(action: {
                                self.editPaymentDetails = true
                                self.selectedPaymentRecord = record
                            }, label: {
                                HStack{
                                    Text("Editar")
                                    Image(systemName: "pencil")
                                }
                            })
                            
                            Button(action: {
                                self.delete(record: record)
                            }, label: {
                                Text("Eliminar")
                                Image(systemName: "trash")
                            })
                        }
                }
                .sheet(isPresented: self.$showPaymentDetails){
                    if let selected = self.selectedPaymentRecord {
                        PaymentDetailView(payment: selected)
                            .presentationDetents([.medium, .large])
                    }
                }
                .sheet(isPresented: self.$editPaymentDetails){
                    if let selected = self.selectedPaymentRecord {
                        PaymentFormView(payment: selected)
                    }
                }
                
                
                
            }
            if self.showPaymentDetails{
                BlankView(bgColor: Color("MainColor"))
                    .opacity(0.4)
            }
        }
    }

    
    
    func delete(record: PaymentRecord){
        self.modelContext.delete(record)
    }

}

#Preview {
    DashboardView()
        .modelContainer(previewContainer)
}

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: PaymentRecord.self,
                                           configurations: ModelConfiguration(isStoredInMemoryOnly:true))
        
        
        for idx in 0...10{
            let newItem = PaymentRecord(date: Bool.random() ? .today : .tomorrow,
                                        name: Bool.random() ? "Curso online" : "Servicio",
                                        amount: Bool.random() ? 150 : 260,
                                        type: Bool.random() ? .income : .expense)
            container.mainContext.insert(newItem)
        }
        
        return container
    } catch{
        fatalError("Imposible crear el Preview Container")
    }
}()


struct MenuBar<Content>: View where Content: View{
    
    @State private var showPaymentForm = false
    
    let modalContent: () -> Content
    
    var body: some View {
        ZStack(alignment: .trailing, content: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                    Text(Date.today.string(with: "EEEE, d MMM, yyyy"))
                        .font(.caption)
                        .foregroundStyle(.teal)
                    
                    Text("Mis Finanzas")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundStyle(.teal)
                })
                
                Spacer()
            })
            
            Button(action: {
                self.showPaymentForm = true
            }, label: {
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.trailing)
            })
            .sheet(isPresented: self.$showPaymentForm, onDismiss: {
                self.showPaymentForm = false
            }){
                self.modalContent()
            }
        })
    }
}


struct TotalBalanceCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("MainColor"))
                .cornerRadius(16)
            
            VStack{
                Text("Balance Total")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        .frame(height: 200)
    }
}

struct TotalIncomeCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("Income"))
                .cornerRadius(16)
            
            VStack{
                Text("Ingresos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        .frame(height: 150)
    }
}

struct TotalExpenseCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("Expense"))
                .cornerRadius(16)
            
            VStack{
                Text("Gastos")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        .frame(height: 150)
    }
}


struct RecordHeader: View {
    
    @Binding var transactionType: TransactionType

    var body: some View {
        VStack{
            HStack{
                Text("Últimas Transacciones")
                    .font(.headline)
                    .foregroundStyle(Color("MainColor"))
                
                Spacer()
            }
            
            HStack{
                Group {
                    Text("Todos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .all ? Color("MainColor") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .all
                        }
                    
                    Text("Ingresos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .income ? Color("Income") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .income
                        }
                    
                    
                    Text("Gastos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .expense ? Color("Expense") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .expense
                        }
                }
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.white)
                .cornerRadius(16)
          
            }
        }
    }
}

struct RecordCellView : View {
    
    var record: PaymentRecord
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: self.record.type == .income ? "arrowshape.up.circle.fill": "arrowshape.down.circle.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(self.record.type == .income ? Color("Income") : Color("Expense")))
            
            VStack(alignment: .leading, content: {
                Text(self.record.name)
                    .font(.system(.body, design: .rounded))
                Text(self.record.date.string())
                    .font(.system(.caption, design: .rounded))
                    .foregroundStyle(.teal)
            })
            Spacer()
            
            Text((self.record.type == .income ? "+" : "-") + NumberFormatter.currency(from: self.record.amount))
                .font(.system(.headline, design: .rounded))
        }
        .padding(.horizontal)
    }
}

