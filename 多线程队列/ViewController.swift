//
//  ViewController.swift
//  多线程队列
//
//  Created by lotawei on 16/11/9.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var  myQueue:DispatchQueue?
    func GCDTest8() {
        let group = DispatchGroup()
        myQueue?.async(group: group, qos: .default, flags: [], execute: {
            for _ in 0...10 {
                
                print("耗时任务一")
            }
        })
        myQueue?.async(group: group, qos: .default, flags: [], execute: {
            for _ in 0...10 {
                
                print("耗时任务二")
                sleep(UInt32(3))
            }
        })
        //等待上面任务执行，会阻塞当前线程，超时就执行下面的，上面的继续执行。可以无限等待 .distantFuture
        let result = group.wait(timeout: .now() + 2.0)
        switch result {
        case .success:
            print("不超时, 上面的两个任务都执行完")
        case .timedOut:
            print("超时了, 上面的任务还没执行完执行这了")
        }
        
        print("接下来的操作")
        
    }
    //设计线程队列
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        myQueue = DispatchQueue(label: "qunen")
        GCDTest8()
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

