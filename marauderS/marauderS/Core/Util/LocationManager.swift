//
//  LocationManager.swift
//  marauderS
//
//  Created by somsak02061 on 6/5/2568 BE.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
//    @Published var degrees: Double = 0
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
//        manager.startUpdatingHeading()
        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
//        degrees = newHeading.trueHeading
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        GlobalVariable.shared.location = location
        print("location=>", location?.latitude)
        print("location=>", location?.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

//final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
//    
//    @Published var lastKnownLocation: CLLocationCoordinate2D?
//    var manager = CLLocationManager()
//
//    func checkLocationAuthorization() {
//        
//        manager.delegate = self
//        manager.startUpdatingLocation()
//        
//        switch manager.authorizationStatus {
//        case .notDetermined://The user choose allow or denny your app to get the location yet
//            manager.requestWhenInUseAuthorization()
//            
//        case .restricted://The user cannot change this app’s status, possibly due to active restrictions such as parental controls being in place.
//            print("Location restricted")
//            
//        case .denied://The user dennied your app to get location or disabled the services location or the phone is in airplane mode
//            print("Location denied")
//            
//        case .authorizedAlways://This authorization allows you to use all location services and receive location events whether or not your app is in use.
//            print("Location authorizedAlways")
//            
//        case .authorizedWhenInUse://This authorization allows you to use all location services and receive location events only when your app is in use
//            print("Location authorized when in use")
//            lastKnownLocation = manager.location?.coordinate
//            
//        @unknown default:
//            print("Location service disabled")
//        
//        }
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {//Trigged every time authorization status changes
//        checkLocationAuthorization()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        lastKnownLocation = locations.first?.coordinate
//    }
//}

//import SwiftUI
//import CoreLocation
//
//@Observable
//class LocationManager: NSObject, CLLocationManagerDelegate {
//  @ObservationIgnored let manager = CLLocationManager()
//    var userLocation: CLLocation?
//    var isAuthorized = false
//    
//    override init() {
//        super.init()
//        manager.delegate = self
//        startLocationServices()
//    }
//    
//    func startLocationServices() {
//        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
//            manager.startUpdatingLocation()
//            isAuthorized = true
//        } else {
//            isAuthorized = false
//            manager.requestWhenInUseAuthorization()
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        userLocation = locations.last
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//        case .authorizedAlways, .authorizedWhenInUse:
//            isAuthorized = true
//            manager.requestLocation()
//        case .notDetermined:
//            isAuthorized = false
//            manager.requestWhenInUseAuthorization()
//        case .denied:
//            isAuthorized = false
//            print("access denied")
//        default:
//            isAuthorized = true
//            startLocationServices()
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//    }
//}
