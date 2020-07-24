//
//  EditViewController.swift
//  Navigation
//
//  Created by sapere4ude on 2020/07/24.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit

// 명시된 프로토콜은 전달받는 곳에서 함수로 만들어 전부 사용해야 한다
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn : Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = " "
    var textMessage: String = " "
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {    // 스위치가 on 상태라면 -> false 상태인 isOn을 true로 변환
            isOn = true
        } else {            // 그게 아니라면 isOn은 false 상태 유지
            isOn = false
        }
    }
    
}
