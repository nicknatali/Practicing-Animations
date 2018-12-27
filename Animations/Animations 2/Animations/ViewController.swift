//
//  ViewController.swift
//  Animations
//
//  Created by Rob Percival on 20/06/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func fadeIN(_ sender: Any) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
        
    }
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1, animations:{
             self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        })
            
        
            
        
        
        
        
    }

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var button: UIButton!
    var counter = 0
    var isAnimating = false
    var timer = Timer()
    
    func animate() {
        image.image = UIImage(named: "frame_\(counter)_delay-0.04s.gif")
        
        counter += 1
        
        if counter >= 21 {
            
            counter = 0
            
        }
    }
    
    
    
    @IBAction func next(_ sender: AnyObject) {
        
        if isAnimating {
            
            timer.invalidate()
            button.setTitle("Start", for: [])
            isAnimating = false
            
        } else {
            
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("Stop", for: [])
            
            isAnimating = true
        }
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

