//
//  LocationSceneView.swift
//  marauderS
//
//  Created by somsak02061 on 6/5/2568 BE.
//

import SwiftUI
import MapKit
import SwiftData

struct LocationSceneView: View {
    
//    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var visibleRegion: MKCoordinateRegion?
    @Query private var destinations: [Destination]
    @State private var destination: Destination?
    
    @StateObject var locationManager = LocationManager()
    
//    var manager = CLLocationManager()
    
    var body: some View {
//        Map(position: $cameraPosition) {
//            if let destination {
//                ForEach(destination.placemarks) { placemark in
//                    Marker(coordinate: placemark.coordinate) {
//                        Label(placemark.name, systemImage: "star")
//                    }
//                    .tint(.yellow)
//                }
//            }
//        }
        
//        .onMapCameraChange(frequency: .onEnd){ context in
//            visibleRegion = context.region
//        }
        
        Map(position: $cameraPosition){
            UserAnnotation()
        }
        .mapControls{
            MapUserLocationButton()
        }
        
        .onAppear {

//            destination = destinations.first
//            
//        let paris = Destination(
//            name: "Paris",
//            latitude: 48.856788,
//            longitude: 2.351077,
//            latitudeDelta: 0.15,
//            longitudeDelta: 0.15
//        )
//            destination = paris
//            
//            if let region = destination?.region {
//                cameraPosition = .region(region)
//            }
            
//            manager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
//            print("latitude=>", manager.location?.coordinate.latitude)
//            print("longitude=>", manager.location?.coordinate.longitude)
            

            
        }
    }
}

#Preview {
    LocationSceneView()
        .modelContainer(Destination.preview)
}
