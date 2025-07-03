import SwiftUI
import MapKit
import SwiftData

struct LocationSceneView: View {
    
    @State private var tappedCoordinate: CLLocationCoordinate2D?

    var body: some View {
        VStack {
            CustomMap(coordinate: $tappedCoordinate)
            
            if let coord = tappedCoordinate {
                //                    Text("Latitude: \(coord.latitude)")
                //                    Text("Longitude: \(coord.longitude)")
            } else {
                //                    Text("Tap the map to get coordinate")
            }
        }
        .padding()
    }
}

#Preview {
    LocationSceneView()
        .modelContainer(Destination.preview)
}

struct CustomMap: UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D?
    var locationManager = LocationManager()

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        
        locationManager.requestLocation()
        
        // ไปยังตำแหน่งผู้ใช้ทันที
        if let location = locationManager.manager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)
        }
        
        let gesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        mapView.addGestureRecognizer(gesture)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    class Coordinator: NSObject {
        var parent: CustomMap

        init(_ parent: CustomMap) {
            self.parent = parent
        }

        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            let location = gesture.location(in: gesture.view)
            if let mapView = gesture.view as? MKMapView {
                let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
                parent.coordinate = coordinate

                // Optional: Drop pin
                mapView.removeAnnotations(mapView.annotations)
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                mapView.addAnnotation(annotation)
            }
        }
    }
}
