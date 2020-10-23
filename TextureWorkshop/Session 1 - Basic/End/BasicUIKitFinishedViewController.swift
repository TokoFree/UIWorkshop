//
//  BasicUIKitFinishedViewController.swift
//  TextureWorkshop
//
//  Created by Ambar Septian on 14/10/20.
//

import UIKit

class BasicUIKitFinishedViewController: UIViewController {
    
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        subView.backgroundColor = .brown
    }
}
