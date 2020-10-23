//
//  BasicUIKitViewController.swift
//  TextureWorkshop
//
//  Created by Ambar Septian on 10/10/20.
//

import UIKit

class BasicUIKitViewController: UIViewController {
    let subView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView
            .centerXAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
        subView
            .centerYAnchor
            .constraint(equalTo: view.centerYAnchor)
            .isActive = true
        subView
            .widthAnchor
            .constraint(equalToConstant: 300)
            .isActive = true
        subView
            .heightAnchor
            .constraint(equalToConstant: 300)
            .isActive = true
        
        subView.backgroundColor = .brown
    }
    
}



