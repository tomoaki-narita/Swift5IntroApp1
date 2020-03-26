//
//  BaseViewController.swift
//  Swift5IntroApp1
//
//  Created by output. on 2020/03/25.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit
//タブが付いた遷移を出来るようにする
import SegementSlide

//親クラスをUIViewControllerからSegementSlideViewControllerに書き換える
class BaseViewController: SegementSlideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
        scrollToSlide(at: 0, animated: true)
        
    }
    override var headerView: UIView?{
        
        //UIImageViewクラスをheaderViewとして使えるようにする
        let headerView = UIImageView()
        //
        headerView.isUserInteractionEnabled = true
        //headerViewの表示をどうするか
        headerView.contentMode = .scaleToFill
        //headerViewのimageに表示する画像のファイル名を指定
        headerView.image = UIImage(named: "ファイル名")
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let headerHeight:CGFloat
        
        if #available(iOS 11.0, *) {
            
            headerHeight = view.bounds.height/4 + view.safeAreaInsets.top
       
        }else{
            
            headerHeight = view.bounds.height/4 + topLayoutGuide.length
        }
        
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
       
        return headerView
   }
    //タブのタイトルを付ける
    override var titlesInSwitcher: [String] {
        
        //作ったタブの分だけControllerフォルダのswiftファイルも必要になる
        return ["TOP","AbemaNews","Yahoo!","IT","Buzz","CNN"]
        }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        switch index {
            
        case 0:
            return
        default:
            <#code#>
        }
        
        
        
        
    }

    

}
