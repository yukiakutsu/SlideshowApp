//
//  GazouViewController.swift
//  SlideshowApp
//
//  Created by Classtream on 2018/04/12.
//  Copyright © 2018年 yuki.akutsu. All rights reserved.
//

import UIKit

class GazouViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
