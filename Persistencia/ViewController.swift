//
//  ViewController.swift
//  Persistencia
//
//  Created by Diego Gomes on 27/02/2016.
//  Copyright © 2016 Nylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var tabledata : [String] = []
    let defaults  = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        checkDataSave()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Button(sender: AnyObject) {
        
        if txtField.text != "" {
            tabledata.append(txtField.text!)
            tableView.reloadData()
            
            saveData()
        }
        
    }
    
    
    //functions of tablecell
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return of number of cell have in my project
        //in this case only one
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //retur number of line
        return tabledata.count
    }
    
    //function for show info line by line
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! CellTableView
        
        //you created let cell now you need user there
        cell.DataLabel.text = tabledata[indexPath.row]
        
        //give return for cell.DataLabel.text
        
        return cell
    }
    
    
    func saveData(){
        
        defaults.setObject(tabledata as [NSString], forKey: "saveData")
        defaults.synchronize()
    }
    
    //validation for discovery if was information salve, return true or false
    func checkDataSave() -> Bool{
        if let saveData : [NSString] = defaults.objectForKey("saveData") as? [NSString]{
            
            //case find you salve and print in screen
            print(saveData)
            for data in saveData{
                tabledata.append(data as String)
            }
            tableView.reloadData()
            
            return true
        
        }
        return false
    }
    
    
    
    
    
    
}
    extension ViewController : UITextFieldDelegate{
    
        //function call in touch
        override func touchesBegan(touches: Set<UITouch>,withEvent event: UIEvent?){
            
            //when finished the touch finished of touch
            view.endEditing(true)
            super.touchesBegan(touches, withEvent: event)
        }
        
        //func call when have edit
        func textFieldDidEndEditing(textField: UITextField) {
            print("\(textField.text)")
        }
    
    }
    



