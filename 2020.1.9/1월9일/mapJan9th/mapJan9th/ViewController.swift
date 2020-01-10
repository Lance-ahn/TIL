//
//  ViewController.swift
//  mapJan9th
//
//  Created by macbook on 2020/01/09.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private var mapView = MKMapView()
    private let textfieldView = UIView()
    private let addressTextField = UITextField()
    private let searchButton = UIButton()
    private var chasingLineArray = [CLLocationCoordinate2D]()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .white
        

        
        setupUI()
        
        mapView.delegate = self
        
    }
    
    func geocodeAddressString(_ addressString: String) {
        print("\n---------- [ 주소 -> 위경도 ] ----------")
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            print(place)
            
            guard let latitude = place.location?.coordinate.latitude else {return}
            
            guard let longitude = place.location?.coordinate.longitude else {return}
            
            
            let myhouse = MKPointAnnotation()
            myhouse.title = addressString
            myhouse.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            self.mapView.addAnnotation(myhouse)
            
            // 위경도값 가져오기
            print(place.location?.coordinate)
            self.setRegion(coordinate: myhouse.coordinate )
            self.addSqure(coordinate: myhouse.coordinate )
            self.drawLine(coordinate: myhouse.coordinate)
        }
        
    }
    @objc func searchAddress() {
        let addressText = addressTextField.text
        geocodeAddressString(addressText!)
    }
    private func setupUI() {
        [mapView, textfieldView].forEach {
            view.addSubview($0)
        }
        
        [addressTextField, searchButton].forEach {
            textfieldView.addSubview($0)
        }
        
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.addTarget(self, action: #selector(searchAddress), for: .touchUpInside)
        textfieldView.backgroundColor = .gray
        addressTextField.textColor = .black
        addressTextField.backgroundColor = .white
        
        let guide = view.safeAreaLayoutGuide
        let margin: CGFloat = 10
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 6),
            mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
        
        textfieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfieldView.topAnchor.constraint(equalTo: guide.topAnchor),
            textfieldView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textfieldView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            textfieldView.bottomAnchor.constraint(equalTo: mapView.topAnchor),
        ])
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressTextField.topAnchor.constraint(equalTo: textfieldView.topAnchor, constant: 1),
            addressTextField.leadingAnchor.constraint(equalTo: textfieldView.leadingAnchor, constant: margin * 2),
            addressTextField.trailingAnchor.constraint(equalTo: textfieldView.trailingAnchor, constant: -(margin * 10)),
            addressTextField.bottomAnchor.constraint(equalTo: textfieldView.bottomAnchor, constant: -1),
        ])
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: textfieldView.topAnchor, constant: 1),
            searchButton.leadingAnchor.constraint(equalTo: addressTextField.trailingAnchor, constant: 1),
            searchButton.trailingAnchor.constraint(equalTo: textfieldView.trailingAnchor, constant: -1),
            searchButton.bottomAnchor.constraint(equalTo: textfieldView.bottomAnchor, constant: -1),
        ])
        
        
    }
    
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    //    private func mornitoringHeading(_ sender: Any) {
    //        guard CLLocationManager.headingAvailable() else { return }
    //        locationManager.startUpdatingHeading()
    //    }
    
    
    private func addSqure(coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        var point1 = center; point1.latitude += 0.01; point1.longitude += 0.01
        var point2 = center; point2.longitude += 0.01;   point2.latitude -= 0.01
        var point3 = center; point3.longitude -= 0.01;  point3.latitude -= 0.01
        var point4 = center; point4.longitude -= 0.01;  point4.latitude += 0.01
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
        
    }
    
    
    private func drawLine(coordinate: CLLocationCoordinate2D) {
        
        chasingLineArray.append(coordinate)
            let polyline = MKPolyline(coordinates: chasingLineArray, count: chasingLineArray.count)
            mapView.addOverlay(polyline)
    }
    
}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .red
            renderer.lineWidth = 1
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}





