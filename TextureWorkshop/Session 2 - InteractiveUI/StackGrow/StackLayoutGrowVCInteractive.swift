//
//  StackLayoutGrowVCInteractive.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackLayoutGrowVCInteractive: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let childVC = StackLayoutGrowVC()
    
    // MARK: Configuration Elements
    
    private let directionText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "direction")
        node.style.width = ASDimensionMake(60)
        return node
    }()
    private let directionOptions = StackDirectionOptionsNode()
    
    private let pinkText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "pink")
        node.style.width = ASDimensionMake(60)
        return node
    }()
    private let pinkOptions = FlexOptionsNode(type: .grow)
    
    private let cyanText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "cyan")
        node.style.width = ASDimensionMake(60)
        return node
    }()
    private let cyanOptions = FlexOptionsNode(type: .grow)
    
    private let greenText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "green")
        node.style.width = ASDimensionMake(60)
        return node
    }()
    private let greenOptions = FlexOptionsNode(type: .grow)
    
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
            let directionStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.directionText, self.directionOptions])
            let pinkStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.pinkText, self.pinkOptions])
            let cyanStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.cyanText, self.cyanOptions])
            let greenStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.greenText, self.greenOptions])
            
            let optionStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [directionStack, pinkStack, cyanStack, greenStack])
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
        directionOptions.onPicked = { [weak self] val in
            self?.childVC.setDirection(val)
        }
        directionOptions.tapbuttonHorizontal()
        
        pinkOptions.onPicked = { [weak self] val in
            self?.childVC.setFlexGrow(for: .pink, val: val)
        }
        
        cyanOptions.onPicked = { [weak self] val in
            self?.childVC.setFlexGrow(for: .cyan, val: val)
        }
        
        greenOptions.onPicked = { [weak self] val in
            self?.childVC.setFlexGrow(for: .green, val: val)
        }
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


