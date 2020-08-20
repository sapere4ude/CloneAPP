//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class CustomizingSegmentedControlViewController: UIViewController {
   
   @IBOutlet weak var segmentedControl: UISegmentedControl!
   
   @IBOutlet weak var titleField: UITextField!
   
   @IBAction func insertSegment(_ sender: Any) {
    guard let title = titleField.text, title.count > 0 else
    {
        return
    }
    
    // 텍스트 파라미터를 추가하는 코드
    segmentedControl.insertSegment(withTitle: title, at: segmentedControl.numberOfSegments, animated: true)
    
    titleField.text = nil // 텍스트 필드 초기화
   }

    
   @IBAction func removeSegment(_ sender: Any) {
    guard let title = titleField.text, title.count > 0 else
    {
        return
    }
    
    for index in
        0..<segmentedControl.numberOfSegments { // 세그먼트의 수 만큼 반복할 수 있는 코드
            if let currentTitle = segmentedControl.titleForSegment(at: index), currentTitle == title {
                segmentedControl.removeSegment(at: index, animated: true)
                break
            }
        }
    
        titleField.text = nil
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalImage = UIImage(named: "segment_normal")
        let selectedImage = UIImage(named: "segment_selected")
        segmentedControl.setBackgroundImage(normalImage, for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(selectedImage, for: .selected, barMetrics: .default)
        
        segmentedControl.setBackgroundImage(normalImage, for: .highlighted, barMetrics: .default)
        
        // 여기 아랫부분 계속 에러남
        
//        segmentedControl.setDividerImage(UIImage(named: "segment_normal_normal"), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
//
//        segmentedControl.setDividerImage(UIImage(named: "segment_normal_selected"), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
//
//        segmentedControl.setDividerImage(UIImage(named: "segment_normal"), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
//
//        segmentedControl.setDividerImage(UIImage(named: "segment_normal_selected"), forLeftSegmentState: .highlighted, rightSegmentState: .selected, barMetrics: .default)
//
//        segmentedControl.setDividerImage(UIImage(named: "segment_normal"), forLeftSegmentState: .selected, rightSegmentState: .highlighted, barMetrics: .default)
//
//        let width = (UIImage(named: "segment_normal_normal") - 20) / 3.0
//        var offset = UIOffset(horizontal: width, vertical: 0)
//        segmentedControl.setContentPositionAdjustment(offset, forSegmentType: .left, barMetrics: .default)
//
//        offset = UIOffset(horizontal: -width, vertical: 0)
//        segmentedControl.setContentPositionAdjustment(offset, forSegmentType: .right, barMetrics: .default)
    
    }
}


















