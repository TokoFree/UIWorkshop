//
//  ProductCardViewController.swift
//  TextureWorkshop
//
//  Created by Benny Kurniawan on 14/10/20.
//


import AsyncDisplayKit

class ProductCardViewController: ASDKViewController<ASTableNode> {
    let model = sampleProducts
    
    override init() {
        super.init(node: ASTableNode())
        title = "Product Lists"
        node.backgroundColor = .white
        node.dataSource = self
        node.allowsMultipleSelection = false
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "exercise", style: .plain, target: self, action: #selector(goToExerciseViewController)), animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        node.view.separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goToExerciseViewController() {
        let vc = ProductCardStarterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductCardViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let data = model[indexPath.row]
        return ProductCardFinalNode(model: data)
    }
}
