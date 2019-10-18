//
//  FirstViewController.swift
//  Test Data
//
//  Created by Nilrajsinh Vaghela on 17/10/19.
//  Copyright © 2019 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let countrylist = ["India","Canada","U.S.A.","China"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countrylist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countrylist[row]
    }
    

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Gender: UISegmentedControl!
    
    @IBOutlet weak var Country: UIPickerView!
    
    
    var data = [[String:Any]]()
    var EditData = [String:Any]()
       
       var dbObj:DBManager?
    
    @IBAction func Done(_ sender: Any) {
        
        
        var cmd = ""
                if(EditData.keys.count == 0)
                            {
                                // to insert
    
                                cmd = "insert into Info(Name, Email) values(\"\(Name.text!)\",\"\(Email.text!)\")"
                                
                            }
                            else{
                               //to update
                                cmd = "update Info set name = '\(Email.text!)' where id = \(Name.text!)"
                                
                                Name.text = ""
                                Email.text = ""
                
                             
                                EditData = [String:Any]()
                            }
                            
              if ((dbObj?.Execute(SQLCommnad: cmd))!)
                            {
                                print("Inserted")
                            }
                            else{
                                print("Not Inserted")
                            }
      

    }
    override func viewDidLoad() {
        super.viewDidLoad()
         dbObj = DBManager()
        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
                view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


}

