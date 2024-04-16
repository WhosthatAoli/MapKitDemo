//
//  ContentView.swift
//  MapKitDemo
//
//  Created by Shaohua Zhang on 4/16/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let desitination = CLLocationCoordinate2D(latitude: 43, longitude: -80)
    let desitination2 = CLLocationCoordinate2D(latitude: 42, longitude: -80)
    let desitination3 = CLLocationCoordinate2D(latitude: 44, longitude: -80)
    let nearDes = CLLocationCoordinate2D(latitude: 43, longitude: -79.5)
    
    @State var camera: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $camera){
            Marker("DES", monogram: Text("ds"), coordinate: desitination)
            
            Annotation("near des", coordinate: nearDes){
                Image(systemName: "person")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Marker("DES2", systemImage: "building", coordinate: desitination2)
                .tint(.blue)
            
            Marker("DES3", coordinate: desitination3)
            
        }
        .safeAreaInset(edge: .bottom){
            HStack{
                Spacer()
                Button{
                    camera = .region(MKCoordinateRegion(center: desitination, latitudinalMeters: 200, longitudinalMeters: 200))
                } label: {
                    Text("CN Tower")
                }
                Spacer()
            }
            .padding(.top)
            .background(.thinMaterial)
            
            
        }
        .mapStyle(.hybrid)
    }
}

#Preview {
    ContentView()
}
