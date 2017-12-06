import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    private var initialLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        if let location = locations.last {
            if initialLocation == nil {
                initialLocation = location
                let initialPlace = Place(title: "Initial Location", subtitle: "This is where everything started", coordinate: location.coordinate)
                mapView.addAnnotation(initialPlace)
            }
            
            let region = MKCoordinateRegionMakeWithDistance(location.coordinate,
                1000, 1000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            print("we have access to user's location")
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            //            locationManager.requestLocation()
            
        default:
            print("you don't have access")
            mapView.showsUserLocation = false
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
}

class Place: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}