//
//  HomeVC.swift
//  Longuage
//
//  Created by Ramakrishna on 7/13/17.
//  Copyright © 2017 Mindtree. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITabBarDelegate {

    var longuage: String?
    @IBOutlet weak var welLbl:UILabel!
    
    @IBOutlet weak var mTabbarView: UITabBar!
        @IBOutlet weak var mTabitem1: UITabBarItem!
        @IBOutlet weak var mTabitem2: UITabBarItem!
        @IBOutlet weak var mTabitem3: UITabBarItem!
        @IBOutlet weak var mTabitem4: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        var marry = [String: NSMutableArray]()
        marry = ["en":["Contatcs","More","history","Downloads"],"js": ["連絡先","もっと","歴史","ダウンロード"], "ch":["往來","更多","歷史","下載"]]
        
        var key: String = ""
        
        if longuage == "Chinese" {
            key = "ch"
            welLbl.text = "歡迎來到Mindtree"
        }
        else if longuage == "Japanese"
        {
            key = "js"
            welLbl.text = "歡迎來到Mindtree"
        }
        else if longuage == "English"
        {
            key = "en"
            //testing
        }
        mTabitem1.title = marry[key]?.object(at: 0) as? String
        mTabitem2.title = marry[key]?.object(at: 1) as? String
        mTabitem3.title = marry[key]?.object(at: 2) as? String
        mTabitem4.title = marry[key]?.object(at: 3) as? String
        mTabbarView.items = [mTabitem1,mTabitem2,mTabitem3,mTabitem4]
        
        // Do any additional setup after loading the view.
    }
    
    //Mark:- UITabBarDelegatedfdfgdgdfg
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let mSelectedVC : SelectedVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "SelectedVC") as! SelectedVC
        mSelectedVC.title = item.title
        
        mSelectedVC.view.backgroundColor = UIColor(red:CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        
        self.navigationController?.pushViewController(mSelectedVC, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
