//
//  Page1ViewController.swift
//  Swift5IntroApp1
//
//  Created by output. on 2020/03/26.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit
//SegementSlideをインポート
import SegementSlide
//SegementSlideContentScrollViewDelegateとXMLParserDelegateを親クラスに追加
class Page1ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景に画像を入れたいのでbackgroundColorをクリアにする
        tableView.backgroundColor = .clear
        
        
        //UIImage型のimageと言う変数名で画像のファイル名も記述
        let image = UIImage(named: "0")
        
        //画像を表示する位置と範囲
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0,
                                    width: self.tableView.frame.size.width,
                                    height: self.tableView.frame.size.height))
        //画像をimageViewに反映
        imageView.image = image
        
        //画像をtableViewの下(background)に置く
        self.tableView.backgroundView = imageView
        
        //XMLパース
      
    }
    
    @objc var scrollView: UIScrollView {
        
        return tableView
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
