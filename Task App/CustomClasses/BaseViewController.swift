//
//  BaseViewController.swift
//  Task App
//
//  Created by Ismael AlShabrawy on 01/12/2020.
//

import UIKit
import PopupDialog
import MapKit
import RxSwift

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addAnnotationToMap(mapView: MKMapView, lat: Double, lng: Double, _ title: String? = nil) {
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        if (title != nil) {
            annotation.title = title!
        }
        mapView.addAnnotation(annotation)
    }
    
    func callDirectionRequest(mapView: MKMapView, directionRequest: MKDirections.Request) {
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            let route = response.routes[0]
            mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
}

extension BaseViewController {
    func showAlert(message: String? = nil) {
        let customDialogXib = CustomDialogXib(nibName: "CustomDialogXib", bundle: nil)
        customDialogXib.view.translatesAutoresizingMaskIntoConstraints = false
        customDialogXib.txtMsg.text = message ?? ""
        
        let popup = PopupDialog(viewController: customDialogXib,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        let dialogAppearance = PopupDialogDefaultView.appearance()
        dialogAppearance.backgroundColor = UIColor(named: "whiteColor")!
        
        let buttonOne = CancelButton(title: "Dismiss") {
            
        }
        
        buttonOne.backgroundColor = UIColor(named: "blackColor")!
        buttonOne.titleColor = UIColor(named: "whiteColor")!
        
        popup.addButtons([buttonOne])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}
