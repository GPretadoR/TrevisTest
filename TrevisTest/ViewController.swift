//
//  ViewController.swift
//  TrevisTest
//
//  Created by Garnik Ghazaryan on 12/5/17.
//  Copyright © 2017 Garnik Ghazaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    dynamic func myFunction() -> Int{
        return 2
    }
    func swizzle_myFunction() -> Int{
        return 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("There are some changes")
        print("new changes to check autobuild")
        
        swizzleMethods()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(myFunction())
    }
    

 
    
    func swizzleMethods() {
        
        if let aClass: AnyClass = object_getClass(self){
            let originalSelector = #selector(ViewController.myFunction)
            let swizzledSelector = #selector(ViewController.swizzle_myFunction)
            
            let originalMethod = class_getInstanceMethod(aClass, originalSelector)
            let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector)
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

