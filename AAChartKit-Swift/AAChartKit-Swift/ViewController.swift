//
//  ViewController.swift
//  AAChartKit-Swift
//
//  Created by Danny boy on 17/4/18.
//  Copyright © 2017年 Danny boy. All rights reserved.
//
//
//#define AAObject(objectName) [[objectName alloc]init]
//
//#define AAPropStatementAndFuncStatement(propertyModifyWord,className, propertyPointerType, propertyName)        \
//@property(nonatomic,propertyModifyWord)propertyPointerType  propertyName;                                               \
//- (className * (^) (propertyPointerType propertyName)) propertyName##Set;

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var person2 = Person.init(name: "jiushizheyang", age: 99);
        person2.name = "hahha,zhizhongyubeiwogaibainle";
        print(person2.name);
        var aachartV = AAChartView();
//        aachartV.addSet(num: "jiangshanmeiren").subSet(num: "shijianjianshi").mulSet(num: "meiyoushenmegnenggouzudang")
        aachartV.addSet("shijianjianshi").mulSet("jiangherixiangrenxinbugu");
        print(aachartV.add)
        print(aachartV.mul)
        
        let student = NSCStudent()
        student.study().playWith("Girl")

    }

 
    struct NSCStudent {
        func study() -> NSCStudent {
            print("The student study")
            return self
        }
        
        func playWith(_ name: String) -> NSCStudent {
            print("The student play with \(name)")
            return self
        }
    }
    
}

