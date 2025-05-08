//
//  LocationSceneView.swift
//  marauderS
//
//  Created by somsak02061 on 6/5/2568 BE.
//

import SwiftUI
import MapKit

struct LocationSceneView: View {
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    var body: some View {
        Map(position: $cameraPosition) {
            
//            Marker("Moulin Rouge", coordinate: .moulinRouge)
//            Marker(coordinate: .arcDeTriomphe) {
//                Label("Arc de Triomphe", systemImage: "star.fill")
//            }
//            .tint(.yellow)
//            Marker("Eiffel Tower", image: "eiffelTower", coordinate: .eiffelTower)
//                .tint(.blue)
//            Marker("Gare du Nord", monogram: Text("GN"), coordinate: .gareDuNord)
//                .tint(.green)
//            Marker("Louvre", systemImage: "person.crop.artframe", coordinate: .louvre)
//                .tint(.blue)
            
//            Annotation("Notre Dame", coordinate: .notreDame) {
//                Image(systemName: "star")
//                    .imageScale(.large)
//                    .foregroundStyle(.red)
//                    .padding(10)
//                    .background(.white)
//                    .clipShape(.circle)
//            }
//            Annotation("Sacré Coeur", coordinate: .sacreCoeur, anchor: .center) {
//                Image(.profile)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 40, height: 40)
//            }
//            Annotation("Pantheon", coordinate: .pantheon) {
//                Image(systemName: "mappin")
//                    .imageScale(.large)
//                    .foregroundStyle(.red)
//                    .padding(5)
//                    .overlay {
//                        Circle()
//                            .strokeBorder(.red, lineWidth: 2)
//                    }
//            }
            MapCircle(
                center: CLLocationCoordinate2D(latitude: 48.856788, longitude: 2.351077),
                radius: 5000
            )
            .foregroundStyle(.red.opacity(0.5))
        }
//        .onMapCameraChange(frequency: .onEnd){ context in
//            visibleRegion = context.region
//        }
        .onAppear {
            // 48.856788, 2.351077
            let paris = CLLocationCoordinate2D(latitude: 48.856788, longitude: 2.351077)
            let parisSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
            let parisRegion = MKCoordinateRegion(center: paris, span: parisSpan)
            cameraPosition = .region(parisRegion)
        }
    }
}

#Preview {
    LocationSceneView()
}

import CoreLocation

// Sample Paris Location
extension CLLocationCoordinate2D {
    static let moulinRouge: Self = .init(
        latitude: 48.884134,
        longitude: 2.332196
    )
    
    static let eiffelTower: Self = .init(
        latitude: 48.858258,
        longitude: 2.294488
    )
    
    static let arcDeTriomphe: Self = .init(
        latitude: 48.873776,
        longitude: 2.295043
    )
    static let gareDuNord: Self = .init(
        latitude: 48.880071,
        longitude: 2.354977
    )
    static let louvre: Self = .init(
        latitude: 48.861950,
        longitude: 2.336902
    )
    static let sacreCoeur: Self = .init(
        latitude: 48.886634,
        longitude: 2.343048
    )
    static let notreDame: Self = .init(
        latitude: 48.852972,
        longitude: 2.350004
    )
    static let pantheon: Self = .init(
        latitude: 48.845616,
        longitude: 2.345996
    )
}
