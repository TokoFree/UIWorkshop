//
//  Lesson1VC.swift
//  TextureWorkshop
//
//  Created by Jefferson Setiawan on 06/10/20.
//

import AsyncDisplayKit

class Lesson1VC: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
