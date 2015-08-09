//
//  ViewController.swift
//  wxTabBar
//
//  Created by Xiaoxueyuan on 15/8/9.
//  Copyright (c) 2015年 Xiaoxueyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var button4MarginLeft: NSLayoutConstraint!
    @IBOutlet weak var button3MarginLeft: NSLayoutConstraint!
    @IBOutlet weak var button2MarginLeft: NSLayoutConstraint!
    @IBOutlet weak var button1MarginLeft: NSLayoutConstraint!
    var selectedIndex:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        containerScrollView.delegate = self
        (tabBar.viewWithTag(1) as! UIButton).selected = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func barButtonDidClicked(sender: AnyObject) {
        var button = sender as! UIButton
        resetButton()
        button.selected = true
        var screenWidth = view.frame.size.width
        containerScrollView.setContentOffset(CGPointMake(CGFloat(button.tag - 1) * screenWidth, 0), animated: false)
        selectedIndex = button.tag
        
    }
    
    func resetButton(){
        for item in tabBar.subviews{
            if item.isKindOfClass(NSClassFromString("UIButton")) == true{
                (item as! UIButton).selected = false
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        var screenWidth = view.frame.size.width
        containerScrollView.setContentOffset(CGPointMake(CGFloat(selectedIndex - 1) * screenWidth, 0), animated: false)
        var marginLeft:CGFloat = (screenWidth - 46 * 4) / 8
        button1MarginLeft.constant = marginLeft
        button2MarginLeft.constant = 2 * marginLeft
        button3MarginLeft.constant = 2 * marginLeft
        button4MarginLeft.constant = 2 * marginLeft
        super.viewDidLayoutSubviews()
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var screenWidth = view.frame.size.width
        var offsetX = scrollView.contentOffset.x
        var selecedButtonIndex = Int(offsetX/screenWidth) + 1
        println(selecedButtonIndex)
        resetButton()
        var button = tabBar.viewWithTag(selecedButtonIndex) as? UIButton
        selectedIndex = selecedButtonIndex
        button?.selected = true
    }

}

