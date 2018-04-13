//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Classtream on 2018/04/12.
//  Copyright © 2018年 yuki.akutsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 画像表示のUI
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var susumubutton: UIButton!
    @IBOutlet weak var modorubutton: UIButton!
    // 再生・停止ボタンのUI
    @IBOutlet weak var buttonstart: UIButton!
    // 表示する画像を配列に格納
    let images: [UIImage] = [UIImage(named: "image1.jpg")!, UIImage(named: "image2.jpg")!, UIImage(named: "image3.jpeg")!]
    // 画像配列の要素
    var index : Int = 0
    // スライドが再生しているか判断するための変数
    var timer : Timer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 進むボタン押下
    @IBAction func susumu(_ sender: Any) {
        // スライドが再生しているか判断
        if (self.timer == nil){
            // 配列を一つ進める
            index += 1
            if(index >= 3){
                index = 0
            }
            // 画像の更新
            button1.setImage(images[index], for: UIControlState())
        }
    }
    // 戻るボタン押下
    @IBAction func modoru(_ sender: Any) {
        // スライドが再生しているか判断
        if self.timer == nil {
            // 配列を一つ戻す
            index -= 1
            if(index < 0){
                index = 2
            }
            // 画像の更新
            button1.setImage(images[index], for: UIControlState())
        }
    }
    // 再生・停止ボタン押下
    @IBAction func saisei_teisi(_ sender: Any) {
        // スライドが停止状態ならスライドをスタート、再生状態ならストップする
        if self.timer == nil {
            // 進むボタン、戻るボタンを入力不可にする
            susumubutton.isEnabled = false
            modorubutton.isEnabled = false
            
            // タイマーを動かす
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slide), userInfo: nil, repeats: true)
            // ボタンを停止に変える
            buttonstart.setTitle("停止", for: UIControlState.normal)
        }else{
            // 進むボタン、戻るボタンを入力可にする
            susumubutton.isEnabled = true
            modorubutton.isEnabled = true
            
            // タイマーをストップ
            self.timer.invalidate()
            self.timer = nil
            // ボタンを再生に変える
            buttonstart.setTitle("再生", for: UIControlState.normal)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    // 画面遷移時に読み込み
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // タイマーが再生中か確認
        if timer != nil {
            // 進むボタン、戻るボタンを入力可にする
            susumubutton.isEnabled = true
            modorubutton.isEnabled = true
            
            // タイマーをストップ
            self.timer.invalidate()
            self.timer = nil
            
            // ボタンを再生に変える
            buttonstart.setTitle("再生", for: UIControlState.normal)
        }
        
        // 遷移後ページのインスタンスを受け取る
        let gazouviewcontroller : GazouViewController = segue.destination as! GazouViewController
        // 遷移後ページの画像プロパティの変更
        gazouviewcontroller.image = images[index]
    }
    
    // タイマーで呼び出されるメソッド
    @objc func slide(timer : Timer){
        // 要素を進め、次の画像にする
        index += 1
        if(index >= 3){
            index = 0
        }
        // 画像の更新
        button1.setImage(images[index], for: UIControlState())
    }
}

