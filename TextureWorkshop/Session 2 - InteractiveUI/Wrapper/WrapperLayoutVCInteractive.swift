//
//  WrapperLayoutVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 08/10/20.
//

import Foundation
import AsyncDisplayKit

internal class WrapperLayoutVCInteractive: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let childVC = WrapperLayoutVC()
    
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
            let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: -spaceFromTop, left: 0, bottom: 0, right: 0), child: self.childVC.node)

            return ASStackLayoutSpec(
                direction: .vertical,
                spacing: 20,
                justifyContent: .start,
                alignItems: .start,
                children: [inset]
            )
        }
    }
    
    // MARK: ViewDidLoad
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildController()
        setupNavigation()
    }
    
    // MARK: ViewWillAppear
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if shouldShowChild == false {
            setupChildRecovery()
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
