

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
class Page4ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    //XMLParserクラスをparserとして宣言(インスタンスを作成する)
    //XMLパース(XML形式の文書やファイルをプログラムやアプリで利用しやすい型に変換する)
    var parser = XMLParser()
    
    //RSSのパース中の現在の要素名をString型で宣言
    var currentElementName:String!
    
    //NewsItemsクラスを入れる変数(newsItems)を準備
    var newsItems = [NewsItems]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景に画像を入れたいのでtableViewのbackgroundColorをクリアにする
        tableView.backgroundColor = .clear
        
        
        //UIImage型のimageと言う変数名で画像のファイル名も記述
        let image = UIImage(named: "3")
        
        //画像を表示する位置と範囲
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0,
                                    width: self.tableView.frame.size.width,
                                    height: self.tableView.frame.size.height))
        //画像をimageViewに反映
        imageView.image = image
        
        //画像をtableViewの下(background)に置く
        self.tableView.backgroundView = imageView
        
        
        //yahooのxmlのurlをurlString(定数)に入れる
        let urlString = "https://www.lifehacker.jp/index.xml"
        
        //上で作ったurlString"文字列型"を"URL型"にしてurl(定数)に入れる
        let url:URL = URL(string: urlString)!
    
        //urlをパースしたいのでXMLParserにセットしてparserに入れる
        parser = XMLParser(contentsOf: url)!
        
        //parserのdelegateをPage1ViewControllerに設定
        parser.delegate = self
      
        //parser(変換)を開始
        parser.parse()
    }
    
    @objc var scrollView: UIScrollView {
        
        return tableView
    }

    // MARK: - Table view data source

    //セクションの数は1つ
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //1セクション中のcellの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        //newsItemsに入って来た値のcount(数文)
        return newsItems.count
    }
    //tableViewのcellの高さを決める
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //cellの高さは画面の高さを5分割した高さにしたい
        return view.frame.size.height/5
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //cellのスタイルを決める(2行にしたいので.subtitleにしてIDはCell)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        //cellのbackgroundColorもclearにする
        cell.backgroundColor = .clear
        
        //パースした値(indexPathのrow番目)をnewsItems(配列)に入れる
        let newsItem = self.newsItems[indexPath.row]
        
        //cellのtextLabelのtextにnewsItemsのtitleを入れる
        cell.textLabel?.text = newsItem.title
        
        //cellのtextLabelのfontを変える(boldの15px)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        //cellのtextLabelのtextColorをwhiteに
        cell.textLabel?.textColor = .white
        
        //cellのtextLabelの行数は最大3行までにする
        cell.textLabel?.numberOfLines = 3
        
        //cellのサブタイトル(2行目)にnewsItemのurlを表示
        cell.detailTextLabel?.text = newsItem.url
        
        //cellのサブタイトル(2行目)のtextColorをwhiteに
        cell.detailTextLabel?.textColor = .white
        
        return cell
    }
    //XMLParserDelegateのデリゲートメソッド
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        //上で宣言したcurrentElementNameの値を空にする
        currentElementName = nil
        
        //もしelementNameに入ってきた値が"item"なら
        //url先のパースが始まって"item"と言うelement(要素)が見つかったら
        if elementName == "item"{
            
            //NewsItemsクラスを初期化して、newsItems(配列)に追加する
            self.newsItems.append(NewsItems())
        
        //そうでない場合("item"と言うelementが見つからなかったら)
        }else{
            //currentElementNameにelementNameを入れる
            currentElementName = elementName
        }
    }
    //目的のものがあった場合に判定するメソッド
    //stringに見つかった要素が入る
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        //もしnewsItemsのcountが0以上だったら
        if self.newsItems.count > 0{
            
            //配列の整合性を合わせるために-1をして、lastItemに入れる
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
            //switch文
            //currentElementNameに入ってくる値が
            switch self.currentElementName {
            
            //"title"と言う要素が見つかったら、lastItemのtitleにstringに入ってきた値を入れる
            case "title":
                lastItem.title = string
                
            //"link"と言う要素が見つかったら、lastItemのurlにstringに入ってきた値を入れる
            case "link":
                lastItem.url = string
                
            //"pubDate"と言う要素が見つかったら、lastItemのpubDateにstringに入ってきた値を入れる
            case "pubDate":
                lastItem.pubDate = string
                
            default:break
           }
        }
    }
    //currentElementNameに値が入ったら空にするメソッド
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        //currentElementNameに入っている値を空にする
        //次の値を入れる準備
        self.currentElementName = nil
    }
    //準備が整ったら呼ぶメソッド
    func parserDidEndDocument(_ parser: XMLParser) {
        
        //tableViewのリロードをする(アップデート)
        self.tableView.reloadData()
    }
    //webViewControllerに値を渡して、表示したい
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //WebViewControllerクラスをwebViewController(変数)に入れる
        let webViewController = WebViewController()
        
        //webViewControllerの画面遷移スタイル
        webViewController.modalTransitionStyle = .crossDissolve
        
        //indexPathにタップされたcellの番号(値)が入ってくる
        //入ってくる値はtitle.url.pubDateの3つ
        //入ってきた値をnewsItemに入れる
        let newsItem = newsItems[indexPath.row]
        
        //"url"と言うキー値をアプリ内に保存
        UserDefaults.standard.set(newsItem.url, forKey: "url")
        
        //webViewControllerに画面遷移
        present(webViewController,animated: true, completion: nil)
        
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
