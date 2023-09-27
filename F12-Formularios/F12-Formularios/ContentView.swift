//
//  ContentView.swift
//  F12-Formularios
//
//  Created by Juan Gabriel Gomila Salas on 26/9/23.
//


import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(name: "Álgebra Lineal", image: "algebralineal", author: "María Santos", difficulty: 1, description: "Curso para iniciarse en el mundo del álgebra lineal", price: 19.99),
        Course(name: "Cálculo", image: "calculo", author: "Arnau Mir y Llorenç Valverde", difficulty: 2, description: "Descubre todo el mundo del cálculo en una variable y practica con Wolfram Alpha y Python", price: 24.99),
        Course(name: "Estadística Descriptiva", image: "descriptiva", author: "María Santos y Juan Gabriel", difficulty: 2, description: "Descubre la Estadística Descriptiva con R y Python", price: 18.99),
        Course(name: "Estadística Inferencial", image: "inferencia", author: "Ricardo Alberich y Arnau Mir", difficulty: 4, description: "Descubre el poder de la inferencia estadística implementando tus tests con R", price: 29.99),
        Course(name: "Matemática Discreta", image: "discreta", author: "Juan Gabriel Gomila", difficulty: 2, description: "Piensa como todo un matemático con los ejerciicos prácticos", price: 14.99),
        Course(name: "Probabilidad", image: "probabilidad", author: "Arnau Mir y  Ricardo Alberich", difficulty: 3, description: "Resuelve problemas de probabilidad y variables aleatoria desde cero y sin experiencia previa", price: 27.99),
        Course(name: "Curso de Latex", image: "latex", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Redacta documentos profesionales gracias al poder de LaTeX", price: 14.99),
        Course(name: "Curso de Sage", image: "sage", author: "Llorenç Valverde y Juan Gabriel Gomila", difficulty: 1, description: "Aprovecha el poder de Sage para resolver problemas matemáticos sin esfuerzo", price: 13.99),
        Course(name: "Prepara la Selectividad", image: "selectividad", author: "María Santos", difficulty: 2, description: "Más de 100 ejercicios resueltos de matemáticas de bachillerato para preparar tu examen de selectividad", price: 22.99),
        Course(name: "Curso de Swift 5 desde cero", image: "swift5", author: "Juan Gabriel Gomila", difficulty: 1, description: "Aprende a programar con el lenguaje oficial para crear apps para dispositivos de iOS", price: 34.99),
        Course(name: "Curso de iOS 10", image: "ios10", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de iOS 11", image: "ios11", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de iOS 12", image: "ios12", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple", price: 39.99),
        Course(name: "Curso de Swift UI con iOS 13", image: "ios13", author: "Juan Gabriel Gomila", difficulty: 2, description: "El curso original que te enseña a crear apps con las novedades del sistema operativo de Apple y el nuevo Framework de Swift UI", price: 29.99)
    ]
    
    @State private var selectedCourse: Course?
    
    @State private var showSettings: Bool = false
    
    @EnvironmentObject var settings : SettingsFactory
    
    init(){
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 30)!
        ]
        navbarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemTeal,
            .font : UIFont(name: "ArialRoundedMTBold", size: 20)!
        ]
        
        UINavigationBar.appearance().standardAppearance = navbarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
        UINavigationBar.appearance().compactAppearance = navbarAppearance
        
        navbarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.uturn.backward"), transitionMaskImage: UIImage(systemName: "arrow.uturn.backward"))
        
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(self.courses.sorted(by: DisplayOrder(type: self.settings.displayOrder).sortPredicate())){ course in
                    if self.shouldShow(course: course) {
                        NavigationLink(destination:     CourseDetailView(course: course)){
                    
                       
                            InfoImageRow(course: course)
                            .contextMenu{
                                Button{
                                    self.purchase(item: course)
                                } label: {
                                    HStack{
                                        Text("Comprar")
                                        Image(systemName: "dollarsign.circle.fill")
                                    }
                                }
                                
                                Button{
                                    self.favourite(item: course)
                                } label: {
                                    HStack{
                                        Text("Favorito")
                                        Image(systemName: "star.fill")
                                    }
                                }
                                
                                Button{
                                    self.delete(item: course)
                                } label: {
                                    HStack{
                                        Text("Eliminar")
                                        Image(systemName: "trash.fill")
                                    }
                                }
                            }
                            .onTapGesture {
                                self.selectedCourse = course
                            }
                        }
                    
                    }
                }
                .listRowSeparatorTint(.teal)
            }
            .listStyle(.insetGrouped)
            
            .navigationTitle("Cursos de Frogames")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        self.showSettings = true
                    }, label: {
                        Image(systemName:"gear.circle")
                            .font(.title)
                    })
                }
            }
            .sheet(isPresented: $showSettings){
                SettingsView().environmentObject(self.settings)
            }
            
        }
        .tint(.teal)
    }
    
    
    
    
    private func purchase(item course: Course){
        if let index = self.courses.firstIndex(where: {$0.id == course.id}){
            self.courses[index].isPurchased.toggle()
        }
    }
    
    private func favourite(item course: Course){
        if let index = self.courses.firstIndex(where: {$0.id == course.id }){
            self.courses[index].isFavourite.toggle()
        }
    }
    
    private func delete(item course: Course){
        if let index = self.courses.firstIndex(where: {$0.id == course.id}){
            self.courses.remove(at: index)
        }
    }
    
    
    
    private func shouldShow(course: Course) -> Bool {
        
        let purchasedCondition = !self.settings.showPurchasedOnly || (self.settings.showPurchasedOnly && course.isPurchased)
        
        let favouriteCondition = !self.settings.showFavouriteOnly || (self.settings.showFavouriteOnly && course.isFavourite)
        
        let difficultyCondition = (course.difficulty <= self.settings.maxDifficultyLevel)
        
        let priceCondition = (self.settings.minPriceShow <= course.price) && (self.settings.maxPriceShow >= course.price)
        
                
        return purchasedCondition && favouriteCondition && difficultyCondition && priceCondition
    }
    
    
}

#Preview {
    ContentView().environmentObject(SettingsFactory())
}

struct InfoImageRow: View {
    
    var course: Course
    
    var body: some View {
        HStack{
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 16)
            
            VStack (alignment: .leading) {
                HStack {
                    Text(course.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    Image(systemName: "cellularbars", variableValue: Double(course.difficulty)/4)
                        .font(.subheadline)
                        .foregroundStyle(.teal)
                }
                Text(course.author)
                    .font(.system(.footnote, design: .rounded))
                    .foregroundStyle(.secondary)
                
                Text("\(String(format: "%.2f",course.price)) €")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack{
                if course.isPurchased{
                    Image(systemName: "checkmark.square.fill")
                        .foregroundStyle(.green)
                        .padding(.bottom, 8)
                }
                
                if course.isFavourite{
                    Image(systemName: "star.circle")
                        .foregroundStyle(.yellow)
                }
            }
            
        }
        
    }
}
