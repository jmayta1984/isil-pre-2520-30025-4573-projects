//
//  GoogleMapView.swift
//  EasyMaps
//
//  Created by Alumno on 21/11/25.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    let store: Store

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: store.latitude, longitude: store.longitude, zoom: 15)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: store.latitude, longitude: store.longitude))
        marker.title = store.name
        marker.snippet = store.description
        
        let map = GMSMapView(options: options)
        marker.map = map
        return map
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
    
    
}
