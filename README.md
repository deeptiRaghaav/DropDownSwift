# DropDownSwift
easy drop down swift

#### Requirements

* iOS 8.0+
* XCode 9.0+
* Swift 4.0 +


#### Manual
The class needed to be included is **TableUI** class .


Implement SelectedDropDown delegate , in that class where you want to show drop down.


make variable --
```
var tblView:TableUI!
```


Button action , in which you want to show drop down



add

```
 tblView = TableUI.init(parentview: self.view, JsonValue1: arr, button1: sender)
 tblView.selectDelegate = self
 ```
 
 Implement delegate method--
 
 in this method you can get selected value 
 
```
 func selectedValue(value:AnyObject ,btnSelected: UIButton)
   {
        print(value)
        
        btnSelected.setTitle(value as? String, for: UIControlState.normal)
    }
```   
###### If you want simple array like -- arr = ["1","2","3","4","5","6","7","8"]
##### so use 
```
TableUI.init(parentview: self.view, JsonValue1: arr, button1: sender) method
```


#### If your json is like 
{
["id": 1, "name": First, "gender": male],
["id": 1, "name": first, "gender": male],
["id": 2, "name": Second, "gender": Fale],
["id": 3, "name": Third, "gender": male], 
["id": 4, "name": Fourth, "gender": Fale]
}

so use -- 
```
init( parentview : UIView , JsonValue1:[[String:AnyObject]] , KeyForShowingValue1:String , button1 : UIButton) method

```
in this method #### KeyForShowingValue1 ##### is the value by which You can send the value of key , which you want to show in drop down
