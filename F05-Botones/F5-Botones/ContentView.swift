//
//  ContentView.swift
//  F5-Botones
//
//  Created by Juan Gabriel Gomila Salas on 18/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //BOTÓN CON TEXTO
        /*Button {
            print("¡Hemos pulsado el botón!")
        } label: {
            Text("¡Hola mundo!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                //.border(Color.green, width: 4)
                .overlay{
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.green, lineWidth: 6)
                }

                
        }*/
        
        //SINTAXIS ANTIGUA
        /*Button(action: {
            print("Hemos pulsado el botón")
        }, label: {
            Text("Hola mundo")
        })*/
        
        
        //BOTÓN CON IMAGEN
        VStack {
            Button{
                print("¡Hemos pulsado el botón con imagen!")
            } label: {
                Label(title: {
                        Text("Editar")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon:{
                        Image(systemName: "square.and.pencil")
                            .font(.largeTitle)
                    }
                )
            }
            .buttonStyle(GradientButtonStyle())
            
            Button{
                print("¡Hemos pulsado el botón con imagen!")
            } label: {
                Label(title: {
                        Text("Compartir")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon:{
                        Image(systemName: "square.and.arrow.up")
                            .font(.largeTitle)
                    }
                )
            }
            .buttonStyle(GradientButtonStyle())
            
            Button{
                print("¡Hemos pulsado el botón con imagen!")
            } label: {
                Label(title: {
                        Text("Eliminar")
                            .fontWeight(.bold)
                            .font(.title)
                    },
                    icon:{
                        Image(systemName: "trash")
                            .font(.largeTitle)
                    }
                )
            }
            .buttonStyle(GradientButtonStyle())
        }
    }
}


struct GradientButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("Evening Sunshine Red"), Color("Evening Sunshine Blue")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 10, x:15, y: 10)
            .padding(.horizontal, 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}



#Preview {
    ContentView()
}
