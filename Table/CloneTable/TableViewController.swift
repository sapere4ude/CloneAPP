//
//  TableViewController.swift
//  CloneTable
//
//  Created by sapere4ude on 2020/07/31.
//  Copyright © 2020 sapere4ude. All rights reserved.
//

import UIKit

var items = ["책 구매", "친구와 약속", "스터디 준비"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    // (매우 중요) 뷰가 전환되어 올 때는 viewWillAppear 와 viewDidAppear 만 호출된다. viewDidLoad 는 단 한번만 호출된다!
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1    // 보통 테이블 안에 섹션이 한 개이므로 numberOfSections의 리턴 값을 1로 한다.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count  // 섹션당 열의 개수는 Items의 개수이므로 리턴값을 items.count로 한다.
    }

    // IndexPath -> tableView의 행을 식별하는 인덱스 경로
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제!"
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]  // 이동할 아이템의 위치를 itemToMove에 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row] // 이동할 아이템의 이미지를 저장
        items.remove(at: (fromIndexPath as NSIndexPath).row) // 이동할 아이템 삭제. 이때 삭제한 아이템 뒤의 아이템들의 인덱스 재정렬
        itemsImageFile.remove(at:(fromIndexPath as NSIndexPath).row) // 이동할 아이템 이미지 삭제. 이미지 아이템의 인덱스 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row) // 삭제된 아이템을 이동할 위치로 삽입. 또한 삽입한 아이템 뒤의 아이템들의 인덱스가 재정렬된다
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row) // 삭제된 아이템의 이미지를 이동할 위치로 삽입. 삽입한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬된다.
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 세그웨이를 이용하여 뷰를 이동하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
    

}
