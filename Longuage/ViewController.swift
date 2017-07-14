//
//  ViewController.swift
//  Longuage
//
//  Created by Ramakrishna on 7/13/17.
//  Copyright © 2017 Mindtree. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var mCountryTf: UIButton!
    @IBOutlet weak var mLonguageTf: UIButton!
    @IBOutlet weak var mPickerView: UIPickerView!
    @IBOutlet weak var mView: UIView!
    
    var mCountryDict = [String: NSMutableArray]()
    var mCommonArray: NSMutableArray = []
    
    var type: String = "English"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView.frame = UIScreen.main.bounds
        self.view.addSubview(mView)
        
        mView.isHidden = true
        
        mCountryDict = ["country" : ["India","China","Japan"],"longuage" :["English","Chinese","Japanese"]]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBtnAction(sender : UIButton){
        
        let mHomeVC : HomeVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        mHomeVC.longuage = type
        self.navigationController?.pushViewController(mHomeVC, animated: false)

        
        
        
        // Changed by Rajesh1234
    }

    @IBAction func selectcountryAndLonguage(sender: UIButton){
        
        if sender.tag == 100 {
            mCommonArray = mCountryDict["country"]!
        }
        else{
            mCommonArray = mCountryDict["longuage"]!
        }
        
        mView.isHidden = false
        
        mPickerView.reloadAllComponents()
        
        //Changed in selectcountryAndLonguage Method
        
    }
    
    //Mark:- UIPickerViewDelegate,UIPickerViewDataSource1
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mCommonArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mCommonArray.object(at: row) as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        mCountryTf.titleLabel?.text = mCountryDict["country"]?.object(at: row) as? String
        mLonguageTf.titleLabel?.text = mCountryDict["longuage"]?.object(at: row) as? String
        
        mView.isHidden = true
        
        type = mCountryDict["longuage"]?.object(at: row) as! String
        
    }
}

