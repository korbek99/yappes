//
//  MapViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    var latitudMap:String?
    var lontitudMap:String?
    var lugarString:String?

    // MARK: - IBOutlets
    lazy var mapkits: MKMapView = {
        let map: MKMapView = .init()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
    }

    // MARK: - Functions
    func setupMapUI(){
        view.addSubview(mapkits)
        mapkits.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapkits.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapkits.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapkits.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func loadMap(){
        let lon = Double(lontitudMap!)
        let lat = Double(latitudMap!)
        let mapi = MKPointAnnotation()
        mapi.title = "Ubicacion  : "  + lugarString!
        mapi.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        mapkits.addAnnotation(mapi)
        mapkits.mapType = .standard
        mapkits.showsUserLocation = true
        mapkits.showsScale = true
        mapkits.showsCompass = true
        updateUI()
        mapkits.setZoomByDelta(delta: 0.5, animated: true)
        updateUI()
    }

    func updateUI() {
        let longitudes = Double(lontitudMap!)
        let latitudes = Double(latitudMap!)
        let oahuCenter = CLLocation(latitude: latitudes!, longitude: longitudes!)
        let region = MKCoordinateRegion(
         center: oahuCenter.coordinate,
         latitudinalMeters: 1000,
         longitudinalMeters: 1000)
       mapkits.setCameraBoundary(
         MKMapView.CameraBoundary(coordinateRegion: region),
         animated: true)
       let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 300000)
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
    func setZoomByDelta(delta: Double, animated: Bool) {
        var _region = region;
        var _span = region.span;
        _span.latitudeDelta *= delta;
        _span.longitudeDelta *= delta;
        _region.span = _span;

        setRegion(_region, animated: animated)
    }
}
