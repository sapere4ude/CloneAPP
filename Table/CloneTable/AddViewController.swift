//
//  AddViewController.swift
//  CloneTable
//
//  Created by sapere4ude on 2020/07/31.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)   // items에 텍스트 필드의 텍스트 값을 추가, Implicitly Unwrapped Optionals
        itemsImageFile.append("clock.png") // 이미지 파일 추가
        tfAddItem.text = ""  // 텍스트 필드의 내용을 지우기
        _ = navigationController?.popViewController(animated: true) // 루트 뷰 컨트롤러, 즉 테이블 뷰로 돌아가기
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
