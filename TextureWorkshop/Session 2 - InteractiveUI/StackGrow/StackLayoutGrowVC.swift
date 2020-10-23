//
//  StackLayoutGrowVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackLayoutGrowVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: Enum
    
    internal enum StackBoxes {
        case pink, cyan, green
    }
    
    // MARK: UI Elements
    
    private let pinkNode = BoxNode(color: .systemPink, size: CGSize(width: 60, height: 120), updateSizeText: true)
    private let cyanNode = BoxNode(color: .cyan, size: CGSize(width: 90, height: 120), updateSizeText: true)
    private let greenNode = BoxNode(color: .green, size: CGSize(width: 125, height: 120), updateSizeText: true)
    
    // MARK: Properties
    
    private var direction: ASStackLayoutDirection = .horizontal
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            return ASStackLayoutSpec(
                direction: self.direction,
                spacing: 0,
                justifyContent: .start,
                alignItems: .start,
                children: [self.pinkNode, self.cyanNode, self.greenNode]
            )
        }
    }
    
    // MARK: Functions
    
    internal func setDirection(_ val: ASStackLayoutDirection) {
        direction = val
        node.setNeedsLayout()
    }
    
    internal func setFlexGrow(for box: StackBoxes, val: Bool) {
        switch box {
        case .pink: pinkNode.style.flexGrow = val ? 1 : 0
        case .cyan: cyanNode.style.flexGrow = val ? 1 : 0
        case .green: greenNode.style.flexGrow = val ? 1 : 0
        }
        
        node.setNeedsLayout()
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



/*/
 
 ** FLEXGROW NOTES **
 
 ---------------------------------------------
 EXAMPLE 1
 ---------------------------------------------
 free space = 100px
 
 blue.style.flexGrow = 1
 red.style.flexGrow = 1
 
 total = 2 units
 1 unit = 100/2 --> 50px
 
 blue + 1 unit --> blue += 50px
 red + 1 unit --> red += 50px
 
 
 ---------------------------------------------
 EXAMPLE 2
 ---------------------------------------------
 free space = 100px
 
 blue.style.flexGrow = 1
 red.style.flexGrow = 3
 
 total = 4 units
 1 unit = 100/4 --> 25px
 
 blue + 1 unit --> blue += 25px
 red + 3 units --> red += 75px
 ---------------------------------------------
 
 */
