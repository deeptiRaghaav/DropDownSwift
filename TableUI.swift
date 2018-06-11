//
//  TableUI.swift
//  DemoTableView
//
//  Created by Deepti  on 12/06/18.
//  Copyright © 2018 Deepti . All rights reserved.
//

import UIKit
protocol SelectedDropDown
{
    func selectedValue(value: AnyObject , btnSelected: UIButton )
}

class TableUI: UIView, UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate

{
    //tble that shows data
    var tblDropDown: UITableView = UITableView()
    var arrDataWithString = [String]()
    var arrData = [[String:AnyObject]]()
    var keyForShowing = String()
    var selectDelegate:SelectedDropDown!
    //superview for adding this view
    var superV:UIView = UIView()
    //button which clicked
    var buttonSelected:UIButton = UIButton()
    var touch : UITapGestureRecognizer = UITapGestureRecognizer()
    var swipeUp : UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var swipeDown : UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var swipeLeft : UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    
    // MARK:-  INIT CODER
    //init coder
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
         self.setUp()
    }
    // MARK:- INIT FRAME
    override init(frame: CGRect) {
         super.init(frame: frame)
        self.setUp()
    }
    
 
    
     init( parentview : UIView , JsonValue1:[[String:AnyObject]] , KeyForShowingValue1:String , button1 : UIButton)
    {
        var framee = CGRect.zero
        let  fram = button1.convert(CGPoint.zero, to: parentview)
        
        if parentview.frame.size.height + parentview.frame.origin.y < fram.y   + button1.frame.size.height + 200
        {
            framee = CGRect(x:fram.x , y:fram.y - 200 , width:button1.frame.size.width , height:200)
        }
        else
        {
            framee = CGRect(x:fram.x , y:fram.y + button1.frame.size.height , width:button1.frame.size.width , height:200)
        }
        
        
        super.init(frame: framee)
        arrData = JsonValue1
        keyForShowing = KeyForShowingValue1
        superV = parentview
        self.set_Gesture()
       
        buttonSelected = button1
        //let w = ((UIApplication.shared.delegate?.window)!)!
        let subviewss = parentview.subviews
        for subV in subviewss
        {
        if (subV.isKind(of: TableUI.self )) {
            subV.removeFromSuperview()
        }
        }
        
        
        self.setUp()
        
    }
     init( parentview : UIView , JsonValue1:[String]  , button1 : UIButton)
    {
        
        var framee = CGRect.zero
        let  fram = button1.convert(CGPoint.zero, to: parentview)
        
        if parentview.frame.size.height + parentview.frame.origin.y < fram.y   + button1.frame.size.height + 200
        {
            framee = CGRect(x:fram.x , y:fram.y - 200 , width:button1.frame.size.width , height:200)
        }
        else
        {
            framee = CGRect(x:fram.x , y:fram.y + button1.frame.size.height , width:button1.frame.size.width , height:200)
        }
       
        super.init(frame: framee)
        arrDataWithString = JsonValue1
        keyForShowing = ""
        superV = parentview
        self.set_Gesture()
        buttonSelected = button1
        //let w = ((UIApplication.shared.delegate?.window)!)!
        let subviewss = parentview.subviews
        for subV in subviewss
        {
            if (subV.isKind(of: TableUI.self )) {
                subV.removeFromSuperview()
            }
        }
        self.setUp()
       // self.init(frame: framee, JsonValue: JsonValue1, button: button1 , parentview:parentview )
        
    }
    func set_Gesture()
    {
        self.touch.addTarget(self, action:#selector(dismiss) )
        touch.cancelsTouchesInView = true
        touch.delegate = self
        self.superV.addGestureRecognizer(touch)
        self.swipeUp.addTarget(self, action:#selector(respondToSwipeGesture(gesture:)) )
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
       
        swipeUp.delegate = self
        
        self.superV.addGestureRecognizer(swipeUp)
        
        self.swipeDown.addTarget(self, action:#selector(respondToSwipeGesture(gesture:)) )
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        
        swipeDown.delegate = self
        
        self.superV.addGestureRecognizer(swipeDown)
        
        self.swipeLeft.addTarget(self, action:#selector(respondToSwipeGesture(gesture:)) )
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        swipeLeft.delegate = self
        
        self.superV.addGestureRecognizer(swipeLeft)
        
        self.swipeRight.addTarget(self, action:#selector(respondToSwipeGesture(gesture:)) )
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        swipeRight.delegate = self
        
        self.superV.addGestureRecognizer(swipeRight)
    }
   
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                self.removeFromSuperview()
                break
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                self.removeFromSuperview()
                break
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                self.removeFromSuperview()
                break
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                self.removeFromSuperview()
                break
            default:
                break
            }
        }
    }

   
    
    //MARK:- FOR HIDE THIS VIEW
   @objc func dismiss ()
    {
       self.removeFromSuperview()
    }
    
    //MARK:- DELEGATE OF TOUCH
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool
    {
        if tblDropDown.bounds.contains(touch.location(in: tblDropDown) )
        {
            return false
        }
         return true
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
   

    
    //MARK:- METHOD FOR SETTING TABLE DATA AND VIEW
   func setUp()
   {
    if buttonSelected.frame.origin.y > self.frame.origin.y
    {
       
         tblDropDown.frame = CGRect(x:0 , y:200 , width:self.frame.size.width , height:0  )
    }
    else
    {
        tblDropDown.frame = CGRect(x:0 , y:0 , width:self.frame.size.width , height:0  )
    }
    
    
    self.backgroundColor = UIColor.clear
//    self.layer.shadowColor = UIColor(red: 33.0/255.0, green: 94.0/255.0, blue: 132.0/255.0, alpha: 1).cgColor
//    self.layer.shadowRadius = 7
//    let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 2)
//    self.layer.shadowPath = path.cgPath
//    self.layer.shouldRasterize = true
//    self.layer.shadowOpacity = 1
    tblDropDown.delegate = self
    tblDropDown.dataSource = self
    tblDropDown.register(UITableViewCell.self, forCellReuseIdentifier: "CellCustom")
   // tblDropDown.layer.cornerRadius = 10
    tblDropDown.layer.borderColor = UIColor.lightGray.cgColor
    tblDropDown.layer.borderWidth = 1
    tblDropDown.layer.masksToBounds = true
    tblDropDown.clipsToBounds = true
    //self.animateTable()
    self.addSubview(tblDropDown)
    UIView.animate(withDuration: 0.5, animations: {
        if self.buttonSelected.frame.origin.y > self.frame.origin.y
        {
             self.tblDropDown.frame = CGRect(x: 0, y: 0 , width: self.frame.size.width , height:self.frame.size.height )
            
        }
        else
        {
            self.tblDropDown.frame = CGRect(x: 0, y: 0 , width: self.frame.size.width , height:self.frame.size.height )
        }
     
    })
  superV.addSubview(self)
 
    }
   
    
    //MARK:- TABLE VIEW DELEGATE
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if keyForShowing == ""
        {
           return arrDataWithString.count
        }
        else
        {
        return arrData.count
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCustom")
        if keyForShowing == ""
        {
           cell?.textLabel?.text = arrDataWithString[indexPath.row]
        }
        else
        {
           let d = arrData[indexPath.row]
           cell?.textLabel?.text = d[keyForShowing] as? String
        }
       
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if keyForShowing == ""
        {
            selectDelegate.selectedValue(value:arrDataWithString[indexPath.row] as AnyObject , btnSelected: buttonSelected)
        }
        else
        {
            let d = arrData[indexPath.row]
            selectDelegate.selectedValue(value:d as AnyObject , btnSelected: buttonSelected)
        }
        
        self.removeFromSuperview()
    }

   
   
}
