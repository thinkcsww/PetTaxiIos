//
//  CustomerMapController.swift
//  PetTaxiIos
//
//  Created by SunWoong Choi on 2018. 8. 5..
//  Copyright © 2018년 SunWoong Choi. All rights reserved.
//

import UIKit
import GoogleMaps
class CustomerMapController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let departureLabelClicked = UITapGestureRecognizer(target: self, action: #selector(departureLabelClickedF))
        departureLabel.isUserInteractionEnabled = true
        departureLabel.addGestureRecognizer(departureLabelClicked)
        departureLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.gray, thickness: 1)
        arrivalLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.gray, thickness: 1)
//        moreButton.layer.cornerRadius = moreButton.frame.size.width / 2
//        moreButton.layer.masksToBounds = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view.
    }
    @objc func departureLabelClickedF(sender: UITapGestureRecognizer) {
        print("tap working")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Location Manager Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 15)
            let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
            
            
            mapView.settings.myLocationButton = true
            mapView.isMyLocationEnabled = true
//            mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 300, right: 0)
            self.view.addSubview(mapView)
            

            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.title = "현재위치"
            marker.map = mapView
            
        }
    }

}


// Extension to draw a border of label
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
