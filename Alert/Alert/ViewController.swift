//
//  ViewController.swift
//  Alert
//
//  Created by sapere4ude on 2020/07/16.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn == true {
            let lampOnAlert = UIAlertController(title: "Warning", message: "현재 ON 상태 입니다", preferredStyle: UIAlertController.Style.alert)   // UIAlertController 생성
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil) // UIAlertAction을 생성 (특별한 동작을 하지 않을 경우엔 handler를 nil로 한다.)
            lampOnAlert.addAction(onAction) // 생성된 onAction을 Alert에 추가한다.
            present(lampOnAlert, animated: true, completion: nil) // present 메서드를 실행
            
        } else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            // UIAlertController 생성
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            // UIAlertAction 생성. 전구를 꺼야 하므로 핸들러에 중괄호 {,}를 넣어 추가적으로 작업, 반드시 self를 붙여야 에러가 발생하지 않는다.
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOff // 익명함수를 사용한건데 이해X
                self.isLampOn = false})
            // UIAlertAction을 추가로 생성. 특별한 동작을 하지 않을 경우에는 핸들러를 nil로 한다.
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            // 생성된 offAction & cancelAction 을 Alert에 추가한다
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil) // UIViewController 에서 사용하는 함수
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오. 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image =  self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오. 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image =  self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네. 제거합니다", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image =  self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
}



