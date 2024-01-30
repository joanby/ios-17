//
//  ContentView.swift
//  F40-Mapas
//
//  Created by Juan Gabriel Gomila Salas on 24/1/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
       /* Map(initialPosition: .region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.59, longitude: 2.68),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))))
       */
        //Map(initialPosition: .item(MKMapItem(placemark: .init(coordinate: .bigben))))
        
        Map(position: self.$position){
            /*Marker("Recoge tu pedido aquí: ",
                   systemImage: "gift",
                   coordinate: .towerbridge)
            .tint(.teal)*/
            
            Annotation("Tu conductor te espera aquí",
                       coordinate: .towerbridge,
                       anchor: .bottom){
                ZStack{
                    Circle()
                        .foregroundStyle(.indigo.opacity(0.5))
                        .frame(width: 75, height: 75)
                    
                    Image(systemName: "car.rear.waves.up")
                        .symbolEffect(.variableColor)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            
            
            ForEach(self.searchResults, id: \.self) { result in
                Marker(item: result)
            }
            
        }
        .mapStyle(.imagery(elevation: .realistic))
        
            .onAppear{
                self.position = .item(MKMapItem(placemark: .init(coordinate: .towerbridge)))
            }
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button(action:{
                        withAnimation {
                            self.position = .camera(MapCamera(centerCoordinate: .towerbridge, distance: 800, heading: 90, pitch: 40))
                            
                            search(location: .towerbridge, query: "restaurants")

                        }
                    }) {
                        Text("Puente de la Torre")
                    }
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        withAnimation {
                            self.position = .camera(MapCamera(centerCoordinate: .bigben, distance: 500, heading: 150, pitch: 70))
                            
                            search(location: .bigben, query: "restaurants")
                        }
                    }, label: {
                        Text("Big Ben")
                    })
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                }
            }
    }
    
    
    private func search(location: CLLocationCoordinate2D, query: String) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: 300,
                                            longitudinalMeters: 300)
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            self.searchResults = response?.mapItems ?? []
        }
        
    }
    
    
    
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let manhattan = CLLocationCoordinate2D(latitude: 40.75, longitude: -73.98)
    
    static let bigben = CLLocationCoordinate2D(latitude: 51.501, longitude: -0.1245)
    
    static let towerbridge = CLLocationCoordinate2D(latitude: 51.5055, longitude: -0.0754)
}
