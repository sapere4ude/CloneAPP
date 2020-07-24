//
//  ViewController.swift
//  Navigation
//
//  Created by sapere4ude on 2020/07/24.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController   // EditViewController.swift 내부에 정의된 변수를 사용하기 위해서 이러한 문법을 작성하고 이를 editViewController 변수를 통해 구현할 수 있게 한다.
        if segue.identifier == "editButton" {
        // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button" // EditViewController.swift 안에 정의된 textWayValue를 사용하는 것
        } else if segue.identifier == "editBarButton" {
        // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.delegate = self  // 위임자가 누구인지 알려주는 과정. editViewController 의 뒷바라지는 내가 할게. 여기서의 '내가' 는 현재 클래스인 ViewController , ViewController -> editViewController : 이벤트가 발생하면 프로토콜에 따라 너에게 연락을 줄게
        editViewController.isOn = isOn  // editViewController, 즉 '수정화면'의 isOn에 '메인화면'의 상태를 전달
    }
    
    // EditViewController.swift 의 프로토콜 내부에 didMessageEditDone 함수를 설정해줬기 때문에 사용할 수 있는 것
    // 이렇게 사용하기 위해서 class 선언부의 마지막에 EditDelegate 를 넣어준다.
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    // EditViewController.swift 의 프로토콜 내부에 didImageOnOffDone 함수가 있기에 반드시 작성해줘야 한다
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true // self는 ViewController를 의미한다
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }

}

