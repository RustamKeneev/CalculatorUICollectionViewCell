//
//  ViewController.swift
//  CalculatorUICollectionViewCell
//
//  Created by Rustam Keneev on 4/17/21.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    var test = ""
    var one: Double?
    var two: Double?
    var operation = ""

    private lazy var label: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.textAlignment = .right
        view.text = "0"
        view.font = UIFont.systemFont(ofSize: 35)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(cellWithClass: ButtonCollectionViewCell.self)
        collectionView.backgroundColor = .clear
//        collectionView.layer.cornerRadius = 50
        return collectionView
    }()

    private lazy var data: [CalculatorModel] = {
        var data: [CalculatorModel] = []
        
        data.append(CalculatorModel(title: "c", color: .darkGray))
        data.append(CalculatorModel(title: "+/-", color: .darkGray))
        data.append(CalculatorModel(title: "%", color: .darkGray))
        data.append(CalculatorModel(title: "/", color: .orange))
        
        data.append(CalculatorModel(title: "7", color: .gray))
        data.append(CalculatorModel(title: "8", color: .gray))
        data.append(CalculatorModel(title: "9", color: .gray))
        data.append(CalculatorModel(title: "*", color: .orange))
        
        data.append(CalculatorModel(title: "4", color: .gray))
        data.append(CalculatorModel(title: "5", color: .gray))
        data.append(CalculatorModel(title: "6", color: .gray))
        data.append(CalculatorModel(title: "-", color: .orange))
        
        data.append(CalculatorModel(title: "1", color: .gray))
        data.append(CalculatorModel(title: "2", color: .gray))
        data.append(CalculatorModel(title: "3", color: .gray))
        data.append(CalculatorModel(title: "+", color: .orange))
        
        data.append(CalculatorModel(title: "0", color: .gray))
        data.append(CalculatorModel(title: ",", color: .gray))
        data.append(CalculatorModel(title: "=", color: .orange))
        
        
        return data
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    func setupUI(){
        
        view.addSubview(label)
        label.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.25)
            make.right.equalToSuperview().offset(-10)
            make.left.equalToSuperview()
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{(make) in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.right.left.bottom.equalToSuperview()
        }
    }
    
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.data[indexPath.row].title == "0" {
            return CGSize(width: (self.collectionView.frame.width / 2.0) - 8,
                          height: (self.collectionView.frame.height / 5.0) - 4)
        }else{
        return CGSize(width: (self.collectionView.frame.width / 4.0) - 8,
                      height: (self.collectionView.frame.height / 5.0) - 8)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.data[indexPath.row]
        self.label.text = (self.label.text ?? String()) + data.title
                
        if self.data[indexPath.row].title == "c"{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withClass: ButtonCollectionViewCell.self, for: indexPath)
        cell.fill(model: self.data[indexPath.row])
        
        return cell
    }
}

