//
//  ViewController.swift
//  ImageView
//
//  Created by sapere4ude on 2020/06/05.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named:"lamp_on.jpg")
        imgOff = UIImage(named:"lamp_off.jpg")
        
        imgView.image = imgOn
    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.width/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom
        
    }
    @IBAction func switchimageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
    }
}

