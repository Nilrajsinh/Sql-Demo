//
//  ToDoTableViewController.swift
//  Test Data
//
//  Created by Nilrajsinh Vaghela on 17/10/19.
//  Copyright © 2019 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var data = [[String:Any]]()
var EditData = [String:Any]()
    var dbObj:DBManager!
    
//    var EditData = [String:Any]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbObj = DBManager()
               
      //  data = dbObj.Execute(SQLQuery: "Select * from Info")
        data = dbObj.Execute(SQLQuery: "Select * from Info")
     
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        infoList = infoManage.Select()
//        print(infoList.count)
        //data = DBManager.shared.runQuery("select * from Info order by id desc")
        tableView.reloadData()
        data = dbObj.Execute(SQLQuery: "select * from Info")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCellTableViewCell
        
        cell.Name.text = (data[indexPath.row]["Name"] as! String)
        cell.Email.text = (data[indexPath.row]["Email"] as! String)
     //   cell.Country.text = data[indexPath.row]["Country"]as! String
     //   cell.Gender.text = data[indexPath.row]["Gender"]as! String
        
        
 
        // Configure the cell...

        return cell
        
      
        
    }
    
    

   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           // if dbObj.Execute(SQLCommnad: "delete from Info where Name = \(data[indexPath.row]["Name"]!)") == true
            if dbObj.Execute(SQLCommnad: "delete from Info where Name = \(data[indexPath.row]["Name"]!)")
        
            
            {
                print("Deleted")
            }
            
           data = dbObj.Execute(SQLQuery: "Select * from Info")
           tableView.reloadData()
           // tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
