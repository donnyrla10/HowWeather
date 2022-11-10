////
////  LocationManager.swift
////  HowWeather
////
////  Created by 김영선 on 2022/11/08.
////
//
//import UIKit
//import CoreLocation //current location(latitude, longitude)
//
//class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
//    @Published var authorizationStatus: CLAuthorizationStatus
//    @Published var lastLocation: CLLocation?
//    @Published var currentPlacemark: CLPlacemark?
//    private let manager = CLLocationManager()
//
//    override init(){
//        authorizationStatus = manager.authorizationStatus
//        super.init()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        lastLocation = locations.first
//        fetchCountryAndCity(for: lastLocation)
//    }
//
//    func fetchCountryAndCity(for location: CLLocation?){
//        guard let location = location else {return}
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
//            self.currentPlacemark = placemarks?.first
//        }
//    }
//
//}
