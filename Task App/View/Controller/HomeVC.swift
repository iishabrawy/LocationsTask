//
//  HomeVC.swift
//  Task App
//
//  Created by Ismael AlShabrawy on 01/12/2020.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa
import RxRelay
import CoreLocation
import PopupDialog

class HomeVC: BaseViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var aboutImg: UIImageView!
    @IBOutlet weak var aboutImgBtn: UIButton!
    
    //MARK: - End Outlets
    
    
    //MARK: - Vars
    let disposeBag = DisposeBag()
    var homeViewModel = HomeViewModel()
    
    
    //MARK: - End Vars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    private func setup() {
        self.delegates()
        
        self.subscribeToAboutImage()
        self.subscribeToResponse()
        
        self.homeViewModel.fetchData()
    }
    
    private func subscribeToAboutImage() {
        self.aboutImgBtn
            .rx
            .tap
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.homeViewModel.fetchAbout()
            }).disposed(by: disposeBag)
    }
    
    private func subscribeToResponse() {
        
        self.homeViewModel.showAlertBehavior
            .subscribe(onNext: { show in
                if (show) {
                    let message = self.homeViewModel.aboutViewModel.innerData![0].content?.htmlToString
                    self.showAlert(message: message)
                }
            }).disposed(by: disposeBag)
        
        self.homeViewModel.directionRequestModel
            .subscribe(onNext: { [weak self] request in
                if (request != nil) {
                    self?.callDirectionRequest(mapView: self!.mapView, directionRequest: request)
                }
            }).disposed(by: disposeBag)
        
        self.homeViewModel.infoModel
            .subscribe(onNext: { [weak self] info in
                if (info != nil && info.innerData != nil) {
                    let route = info.innerData?.user?.bus?.route
                    let pickupLocation = route?.pickupLocation
                    let dropOffLocation = route?.dropoffLocation
                    
                    self?.addAnnotationToMap(mapView: self!.mapView, lat: pickupLocation!.lat!, lng: pickupLocation!.lng!, "Pickup")
                    self?.addAnnotationToMap(mapView: self!.mapView, lat: dropOffLocation!.lat!, lng: dropOffLocation!.lng!, "DropOff")
                    
                    route?.stopPoints?.forEach({ (stopPoint) in
                        self?.addAnnotationToMap(mapView: self!.mapView, lat: stopPoint.lat!, lng: stopPoint.lng!)
                    })
                    
                    self?.homeViewModel.drawRoute()
                    DispatchQueue.main.async {
                        self?.aboutImg.isHidden = false
                    }
                }
            }).disposed(by: disposeBag)
    }
    
    func delegates() {
        self.mapView.delegate = self
    }
    
}

extension HomeVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 3.0
        return renderer
    }
}

