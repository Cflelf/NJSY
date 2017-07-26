//
//  GameViewController.swift
//  NJSY
//
//  Created by Pxr on 2017/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SpriteKit

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(jumpToSecondView))
    
        self.view.addGestureRecognizer(gesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func jumpToSecondView(){
        let destinationStoryboard = UIStoryboard(name:"Main", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "SecondView")
        self.present(destinationViewController, animated: true, completion: nil)
    }

}
