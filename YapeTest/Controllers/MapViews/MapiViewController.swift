//
//  MapiViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 23-02-23.
//

import UIKit
import MapKit
class MapiViewController: UIViewController {

    var latitudMap:String?
    var lontitudMap:String?
    var lugarString:String?
    
    @IBOutlet weak var mapas: MKMapView!
    

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
    }


    func loadMap(){
        let lon = Double(lontitudMap!)
        let lat = Double(latitudMap!)
        let mapi = MKPointAnnotation()
        mapi.title = "Ubicacion  : "  + lugarString!
        mapi.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        mapas.addAnnotation(mapi)
        mapas.mapType = .standard
        mapas.showsUserLocation = true
        mapas.showsScale = true
        mapas.showsCompass = true
        updateUI()
        mapas.setZoomByDeltas(delta: 0.5, animated: true)
        updateUI()
    }
    func centerMapOnLocation(_ location: CLLocation, mapView: MKMapView) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    func updateUI() {
        let longitudes = Double(lontitudMap!)
        let latitudes = Double(latitudMap!)
        let oahuCenter = CLLocation(latitude: latitudes!, longitude: longitudes!)
        let region = MKCoordinateRegion(
         center: oahuCenter.coordinate,
         latitudinalMeters: 300,
         longitudinalMeters: 300)
        mapas.setCameraBoundary(
         MKMapView.CameraBoundary(coordinateRegion: region),
         animated: true)
       let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1000)
    }
    //MARK:mapView
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}
extension MKMapView {
    func setZoomByDeltas(delta: Double, animated: Bool) {
        var _region = region;
        var _span = region.span;
        _span.latitudeDelta *= delta;
        _span.longitudeDelta *= delta;
        _region.span = _span;

        setRegion(_region, animated: animated)
    }
}
