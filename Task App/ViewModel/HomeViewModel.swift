//
//  HomeViewModel.swift
//  Task App
//
//  Created by Ismael AlShabrawy on 01/12/2020.
//

import RxSwift
import RxRelay
import Alamofire
import CoreLocation
import MapKit
import PopupDialog

class HomeViewModel {
    
    var showAlertBehavior = BehaviorRelay<Bool>(value: false)
    
    private var infoModelVar = BehaviorRelay<InfoModel>(value: InfoModel.init())
    var infoModel: Observable<InfoModel> {
        return infoModelVar.asObservable()
    }
    
    private var directionRequestVar = BehaviorRelay<MKDirections.Request>(value: MKDirections.Request())
    var directionRequestModel: Observable<MKDirections.Request> {
        return directionRequestVar.asObservable()
    }
    
    var infoViewModel: InfoModel {
        didSet {
            self.saveApiToken()
        }
    }
    
    private var aboutModelVar = BehaviorRelay<AboutModel>(value: AboutModel.init())
    var aboutModel: Observable<AboutModel> {
        return aboutModelVar.asObservable()
    }
    
    var aboutViewModel: AboutModel
    
    init() {
        self.infoViewModel = InfoModel()
        self.aboutViewModel = AboutModel()
    }

    func fetchData() {
        let infoResource = Resource<InfoModel>(url: URL(string: Utils().parseConfig().BaseURL)!, endPoint: "/account/checkCredentials")
        let prams = ["name": "bola_d",
                     "password": "1234",
                     "deviceToken": ""]
        let heads = ["Content-Type": "application/json",
                     "Accept": "application/json"]
        let headers = HTTPHeaders(heads)
        
        Webservice().load(resource: infoResource, method: .post, prams: prams, headers: headers, encoding: .queryString) { result in
            switch result {
            case .success(let info):
                if (info != nil && info.innerData != nil && info.innerData!.user != nil) {
                    self.infoViewModel = info
                    self.infoModelVar.accept(info)
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func fetchAbout() {
        let aboutResource = Resource<AboutModel>(url: URL(string: Utils().parseConfig().BaseURL)!, endPoint: "/aboutus/aboutUs")
        let heads = ["Authorization": "Bearer \(self.getApiToken())",
                     "Accept": "application/json"]
        let headers = HTTPHeaders(heads)
        
        Webservice().load(resource: aboutResource, method: .get, prams: nil, headers: headers, encoding: .default) { result in
            switch result {
            case .success(let about):
                if (about != nil && about.innerData != nil) {
                    self.aboutViewModel = about
                    self.aboutModelVar.accept(about)
                    self.showAlertBehavior.accept(true)
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func drawRoute() {
        let routePath = self.infoViewModel.innerData?.user?.bus?.route?.routePath
        let firstItem = routePath![0]
        let sourceLocation = CLLocationCoordinate2D(latitude: firstItem.lat!, longitude: firstItem.lng!)
        let lastItem = routePath![routePath!.count - 1]
        let destinationLocation = CLLocationCoordinate2D(latitude: lastItem.lat!, longitude: lastItem.lng!)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        self.setMapPlaceMarks(sourcePlacemark: sourcePlacemark, destinationPlacemark: destinationPlacemark)
    }
    
    func setMapPlaceMarks(sourcePlacemark: MKPlacemark, destinationPlacemark: MKPlacemark) {
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        self.directionRequestVar.accept(directionRequest)
    }
    
    func saveApiToken() {
        KeychainWrapper.standard.set(self.infoViewModel.innerData?.token ?? "", forKey: "ApiToken")
    }
    
    func getApiToken() -> String {
        let token = KeychainWrapper.standard.string(forKey: "ApiToken") ?? ""
        return token
    }
    
}
