//
//  ViewController.swift
//  Map
//
//  Created by sapere4ude on 2020/07/22.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 사용자에게 승인 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        myMap.showsUserLocation = true
        
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)   // 위도, 경도를 매개변수로해서 CLLocationCoordinate2DMake 함수 호출한 뒤 pLocation에 넘겨주기
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 범위 값을 매개변수로 해서 넘겨주기
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true) // pRegion을 매개변수로 하여 myMap.setRegion 함수를 호출
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, logitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()    // 핀을 설치하기 위한 함수를 호출, return 값을 annotation 에 넣어준다
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: logitudeValue, delta: span)
        // annotation 의 coordinate 값을 goLocation 함수로부터 CLLocationCoordinate2D 형태로 받아야 하는데, 이를 위해서
        // goLocation 함수를 수정해야한다.
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last  // 위치 업데이트되면 마지막 위치 값을 찾게 됨
        
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
            longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)   // 마지막 위치의 위도, 경도값을 가지고 앞에서 만든 goLocation을 호출. delta는 지도의 크기를 정하는데 값이 적을수록 확대되는 효과가 있음 (0.01은 100배 확대를 의미)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!  // 문자열 address에 country 상수 값을 대입
            
            if pm!.locality != nil {    // 지역
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {    // 주요도로
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        
        //locationManager.stopUpdatingLocation()
        
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            // 폴리텍대학
            setAnnotation(latitudeValue: 37.500655, logitudeValue: 126.942400, delta: 1, title: "빵숭이집", subtitle: "서울특별시 동작구 상도동 416 현대IPARK아파트")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "서울특별시 동작구 상도동 416 현대IPARK아파트"
        }
        else if sender.selectedSegmentIndex == 2 {
            // 상명대학교 표시
            setAnnotation(latitudeValue: 37.556876, logitudeValue: 126.914066, delta: 0.1, title: "이지퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
    }
    
}

