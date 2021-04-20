//
//  ButtonCollectionViewCell.swift
//  CalculatorUICollectionViewCell
//
//  Created by Rustam Keneev on 4/17/21.
//

import UIKit
import SnapKit

class ButtonCollectionViewCell: UICollectionViewCell{
    
    private var label: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.text = "0"
        view.font = UIFont.systemFont(ofSize:36)
        view.textAlignment = .right
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .gray
        
        layer.cornerRadius = 10
        setupUI()
    }
    
    func fill(model:CalculatorModel){
        backgroundColor = model.color
        label.text = model.title
    }
    
    private func setupUI(){
        addSubview(label)
     
        label.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UICollectionView{
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type){
        register(T.self,forCellWithReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
}
