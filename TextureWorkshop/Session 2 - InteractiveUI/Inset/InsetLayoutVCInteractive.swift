//
//  InsetLayoutVCInteractive.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 12/10/20.
//

import Foundation
import AsyncDisplayKit

internal class InsetLayoutVCInteractive: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let childVC = InsetLayoutVC()
    
    // MARK: Configuration Elements
    
    private let topText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "top")
        node.style.width = ASDimensionMake(50)
        return node
    }()
    private let topOptions = InsetOptionsNode()
    
    private let bottomText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "bottom")
        node.style.width = ASDimensionMake(50)
        return node
    }()
    private let bottomOptions = InsetOptionsNode()
    
    private let leftText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "left")
        node.style.width = ASDimensionMake(50)
        return node
    }()
    private let leftOptions = InsetOptionsNode()
    
    private let rightText: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "right")
        node.style.width = ASDimensionMake(50)
        return node
    }()
    private let rightOptions = InsetOptionsNode()
    
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
            let topStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.topText, self.topOptions])
            let bottomStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.bottomText, self.bottomOptions])
            let leftStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.leftText, self.leftOptions])
            let rightStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [self.rightText, self.rightOptions])
            
            let optionStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [topStack, leftStack, bottomStack, rightStack])
            let optionsInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: .infinity, left: 32, bottom: 20, right: 0), child: optionStack)

            return ASAbsoluteLayoutSpec(children: [childInset, optionsInset])
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
        topOptions.onPicked = { [weak self] val in
            self?.childVC.setInsets(side: .top, value: val)
        }
        topOptions.tapButton0()
        
        bottomOptions.onPicked = { [weak self] val in
            self?.childVC.setInsets(side: .bottom, value: val)
        }
        bottomOptions.tapButtonInfinity()
        
        leftOptions.onPicked = { [weak self] val in
            self?.childVC.setInsets(side: .left, value: val)
        }
        leftOptions.tapButton0()
        
        rightOptions.onPicked = { [weak self] val in
            self?.childVC.setInsets(side: .right, value: val)
        }
        rightOptions.tapButtonInfinity()
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

