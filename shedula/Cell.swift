//
//  Cell.swift
//  RealmExample
//
//  Created by algo on 5/16/16.
//  Copyright © 2016 algostudio. All rights reserved.
//

import UIKit
import Canvas

class Cell: UITableViewCell {
    
    
    
    
 
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblAddress: UILabel!
    
    @IBAction func switchTapped(myswitch: UISwitch) {
        
        lblName.startCanvasAnimation()
        
        if myswitch.on {
            lblAddress.hidden = false
            
        }
        else{
            
        lblAddress.hidden = !lblAddress.hidden
            
        }
        
    }
  
    
    
      
}