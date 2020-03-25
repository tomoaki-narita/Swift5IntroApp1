//
//  IntroViewController.swift
//  Swift5IntroApp1
//
//  Created by output. on 2020/03/25.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit
//アニメーション
import Lottie
//UIScrollViewDelegateクラスを宣言
class IntroViewController: UIViewController,UIScrollViewDelegate {

    //scrollView
    @IBOutlet weak var scrollView: UIScrollView!
 
    //jsonファイルの配列(ファイル名)
    var onboardArray = ["1","2","3","4","5"]
   
    //文字列の配列、jsonの配列と一対
    var onboardStringArray = ["Hello.World","Hello.Swift","Hello.Ruby","Hello.Python","Hello.Java"] 
  
    override func viewDidLoad() {
        super.viewDidLoad()

        //scrollViewをページングできるようにする(1,2,3と止まる)
        scrollView.isPagingEnabled = true
        //setUpScrollメソッドを呼ぶ
        setUpScroll()
        
        //Lottieをfor文で設定する
        //iの中に入る値は0,1,2,3,4をループする
        for i in 0...4{
            
            //AnimationViewクラスをanimationView(定数)として初期化
            let animationView = AnimationView()
            
            //ページごとにanimationを分けたいのでonboardArrayの[i]番目とする
            let animation = Animation.named(onboardArray[i])
            
            //animationViewのフレームを決める
            //CGFloat(i)のiに入る値はInt型なのでCGFloat型にキャスト
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height / 1.3)
            
            //animationの設定
            //jsonの配列(animation)をanimationViewのanimationに表示
            animationView.animation = animation
            
            //animationViewの表示範囲
            animationView.contentMode = .scaleAspectFit
            
            //animationViewをループするか
            animationView.loopMode = .loop
            
            //animationViewをplay
            animationView.play()
            
            //
            scrollView.addSubview(animationView)
        }
    }
    //navigationバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    //scrollViewをセットアップするメソッド
    func setUpScroll(){
       
        //scrollViewのdelegateをselfに設定
        scrollView.delegate = self
        
       //scrollViewの可動範囲、コンテンツのsizeを決める
       //横にページングしたいので配列の５と同じくするためにwidth*5(x5)する
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        
       //for文でラベルをつける
       //iの中に入る値は0,1,2,3,4をループする
        for i in 0...4{
            
            //scrollViewのx軸y軸の位置、縦横の大きさを決める
            //CGFloat(i)のiに入る値はInt型なのでCGFloat型にキャスト
            //最初に(i)に入る値は0なので、0 * view.frame.size.widthでX軸は0になる
            //次回ってきた時は(i)に入っている値は1なのでラベルが右のページにいく(1ページ進む)
            let  onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) *    view.frame.size.width, y: view.frame.size.height/3,
                 width: scrollView.frame.size.width,
                 height: scrollView.frame.size.height/1.2))
            
            //onboardLabelのフォントをboldに、sizeを15にする
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            
            //onboardLabelのテキストの配置をセンターにする
            onboardLabel.textAlignment = .center
            
            //onboardLabelのtextにonboardStringArrayの[i]番目を入れる
            //[i]の値は0,1,2,3,4とループする
            onboardLabel.text = onboardStringArray[i]
            
            //
            scrollView.addSubview(onboardLabel)
            
        }
    }

   

}
