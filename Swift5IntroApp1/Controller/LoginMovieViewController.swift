//
//  LoginMovieViewController.swift
//  Swift5IntroApp1
//
//  Created by output. on 2020/03/25.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit
//背景に動画を貼る
import AVFoundation

class LoginMovieViewController: UIViewController {
    
    //AVPlayerクラスをplayer(変数名)として使う
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景に貼る動画のファイル名と拡張子をpath(定数)に入れる
        let path = Bundle.main.path(forResource: "start", ofType: "mov")
        
        //AVPlayerにpathを設定
        player = AVPlayer(url: URL(fileURLWithPath: path!))

        //AVPlayer用のレイヤーを生成
        let playerLayer = AVPlayerLayer(player: player)
        
        //playerLayerのframeは画面一杯に表示する
        playerLayer.frame = CGRect(x: 0, y: 0,
                                   width: view.frame.size.width,
                                   height: view.frame.size.height)
        
        //resizeAspectFillは比率を保ったまま中央を基準に動画が画面一杯に拡大
        playerLayer.videoGravity = .resizeAspectFill
        //ループカウントは0にしておく
        playerLayer.repeatCount = 0
        //z軸の設定(画面のレイヤーの順番。値が高いほど手前のレイヤーになる)
        playerLayer.zPosition = -1
        //
        view.layer.insertSublayer(playerLayer, at: 0)
        //動画が最後まで再生される→inの中に入る→最初に戻す→また再生
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            
            //seek(求める、探す)、zeroに戻す
            self.player.seek(to: .zero)
            
//            self.player.play()
        }
        //再生
        self.player.play()
       
    }
    //navigationバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    //loginボタンを押した時の処理
    @IBAction func login(_ sender: Any) {
        
        //背景の動画を止める
        player.pause()
     }
    
}
