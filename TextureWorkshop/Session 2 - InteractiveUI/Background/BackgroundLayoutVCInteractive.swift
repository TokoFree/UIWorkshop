//
//  BackgroundLayoutVCInteractive.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class BackgroundLayoutVCInteractive: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let childVC = BackgroundLayoutVC()
    
    // MARK: Configuration Elements
    
    private let lengthText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "text length")
        node.style.width = ASDimensionMake(80)
        return node
    }()
    private let lengthOptions = BackgroundOptionsNode()
    
    private let opacityText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "opacity")
        node.style.width = ASDimensionMake(80)
        return node
    }()
    private let opacityOptions = OverlayOptionsNode()
    
    // MARK: Properties
    
    private let scaleRatio: CGFloat = 4/6
    private var shouldShowChild: Bool = true
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self, self.shouldShowChild else { return ASLayoutSpec() }
            
            // Make scaled VC
            self.childVC.node.style.preferredSize = size.max
            let spaceFromTop = ((size.max.height * (1-self.scaleRatio)) / 2) - 16
            let childInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: -spaceFromTop, left: 0, bottom: 0, right: 0), child: self.childVC.node)
            
            // Make inset options
            let lengthStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.lengthText, self.lengthOptions])
            let opacityStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.opacityText, self.opacityOptions])
            
            let optionStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [lengthStack, opacityStack])
            let optionsInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: .infinity, left: 32, bottom: 20, right: 0), child: optionStack)

            return ASAbsoluteLayoutSpec(children: [childInset, ASInsetLayoutSpec(insets: .zero, child: optionsInset)])
        }
    }
    
    // MARK: ViewDidLoad
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildController()
        setupNavigation()
        setupOptions()
    }
    
    // MARK: ViewWillAppear
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if shouldShowChild == false {
            setupChildRecovery()
        }
    }
    
    // MARK: Functions
    
    private func setupOptions() {
        lengthOptions.onPicked = { [weak self] val in
            self?.childVC.setTextType(type: val)
        }
        lengthOptions.tapButtonMedium()
        
        opacityOptions.onPicked = { [weak self] val in
            self?.childVC.setOpacity(val: val)
        }
        opacityOptions.tapButton20()
    }
    
    // MARK: ChildVC Setup
    
    private func setupNavigation() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Real VC", style: .plain, target: self, action: #selector(goToChildVC)), animated: false)
    }
    
    private func setupChildController() {
        addChild(childVC)
        childVC.didMove(toParent: self)
        
        childVC.node.borderColor = UIColor.black.cgColor
        childVC.node.borderWidth = 2
        childVC.node.transform = CATransform3DMakeScale(4/6, 4/6, 1)
    }
    
    private func setupChildRecovery() {
        childVC.node.borderWidth = 2
        shouldShowChild = true
        childVC.node.transform = CATransform3DMakeScale(4/6, 4/6, 1)
        node.setNeedsLayout()
    }
    
    @objc private func goToChildVC() {
        shouldShowChild = false
        childVC.node.borderWidth = 0
        childVC.node.transform = CATransform3DMakeScale(1, 1, 1)
        node.setNeedsLayout()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.navigationController?.pushViewController(self.childVC, animated: true)
        }
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




