//
//  BoxNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 12/10/20.
//

import Foundation
import AsyncDisplayKit

internal class BoxNode: ASDisplayNode {
    
    // MARK: UI Element
    
    private let boxNode = ASDisplayNode()
    private let textNode = ASTextNode2()
    
    // MARK: Properties
    
    private var updateSizeText: Bool
    
    // MARK: Initialization
    
    internal init(color: UIColor, size: CGSize, updateSizeText: Bool = false) {
        self.updateSizeText = updateSizeText
        super.init()
        automaticallyManagesSubnodes = true
        
        style.preferredSize = size
        boxNode.backgroundColor = color
        
        textNode.attributedText = NSAttributedString(string: "w: \(Int(size.width)) | h: \(Int(size.height))", attributes: [NSAttributedString.Key.font: UIFont(name: "Arial", size: 22.0)!])
    }
    
    // MARK: Layout Did Finish
    
    internal override func layoutDidFinish() {
        super.layoutDidFinish()
        if updateSizeText == false { return }
        
        let size = calculatedSize
        textNode.attributedText = NSAttributedString(string: "w: \(Int(size.width)) | h: \(Int(size.height))", attributes: [NSAttributedString.Key.font: UIFont(name: "Arial", size: 22.0)!])
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let center = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: textNode)
        return ASOverlayLayoutSpec(child: boxNode, overlay: center)
    }
}
