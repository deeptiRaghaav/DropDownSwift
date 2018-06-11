//
//  ViewController.swift
//  DropDown
//
//  Created by Deepti on 11/06/18.
//  Copyright © 2018 Deepti. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,SelectedDropDown
{
    
    var tblView:TableUI!
    //var arr = [[String:AnyObject]]()
    var arr = [String]()
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        //        arr = [["id": "1" as AnyObject , "name":"First" as AnyObject , "gender": "male" as AnyObject  ],["id": "1" as AnyObject , "name":"first" as AnyObject , "gender": "male" as AnyObject  ],
        //               ["id": "2" as AnyObject , "name":"Second" as AnyObject , "gender": "Fale" as AnyObject  ],
        //               ["id": "3" as AnyObject , "name":"Third" as AnyObject , "gender": "male" as AnyObject  ],
        //               ["id": "4" as AnyObject , "name":"Fourth" as AnyObject , "gender": "Fale" as AnyObject  ]]
        arr = ["1","2","3","4","5","6","7","8"]
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnClick(_ sender: UIButton)
    {
        print(self.view.frame)
        print(sender.frame)
        tblView = TableUI.init(parentview: self.view, JsonValue1: arr, button1: sender)
        tblView.selectDelegate = self
        print(sender.contentRect(forBounds: self.view.frame) )
        
    }
    func selectedValue(value:AnyObject ,btnSelected: UIButton)
    {
        print(value)
        
        btnSelected.setTitle(value as? String, for: UIControlState.normal)
    }
    
}

