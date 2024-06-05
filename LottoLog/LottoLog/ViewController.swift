//
//  ViewController.swift
//  LottoLog
//
//  Created by Jisoo HAM on 6/5/24.
//

import UIKit

import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    let numberStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 7
        return stack
    }()
    
    var drawNo1 = CircleView()
    var drawNo2 = CircleView()
    var drawNo3 = CircleView()
    var drawNo4 = CircleView()
    var drawNo5 = CircleView()
    var drawNo6 = CircleView()
    var bonus = CircleView()
    var plusView: CircleView = {
        let circle = CircleView()
        circle.plusUI(plus: "+")
        circle.drawLabel.textColor = .black
        return circle
    }()
    
    let descriptionView = DescriptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networking()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func networking() {
        let url = privateKey.lottoURL + "1107"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let lotto):
                self.drawNo1.configureUI(
                    number: lotto.drwtNo1
                )
                self.drawNo2.configureUI(
                    number: lotto.drwtNo2
                )
                self.drawNo3.configureUI(
                    number: lotto.drwtNo3
                )
                self.drawNo4.configureUI(
                    number: lotto.drwtNo4
                )
                self.drawNo5.configureUI(
                    number: lotto.drwtNo5
                )
                self.drawNo6.configureUI(
                    number: lotto.drwtNo6
                )
                self.bonus.configureUI(
                    number: lotto.bnusNo
                )
                self.descriptionView.configureUI(
                    date: lotto.changedDate,
                    drawNumber: lotto.changedDrawNo
                )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureHierarchy() {
        
        [descriptionView, numberStackView]
            .forEach { view.addSubview($0) }
        
        [drawNo1, drawNo2, drawNo3, drawNo4,
         drawNo5, drawNo6, plusView, bonus]
            .forEach { numberStackView.addArrangedSubview($0) }
        
    }
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea).offset(100)
            make.centerX.equalTo(safeArea)
            make.leading.trailing.equalTo(safeArea).inset(15)
            make.width.greaterThanOrEqualTo(80)
        }
        
        numberStackView.snp.makeConstraints { make in
            make.centerX.equalTo(safeArea)
            make.top.equalTo(descriptionView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(safeArea).inset(15)
            make.height.equalTo(40)
        }
        
    }
    func configureUI() {
        view.backgroundColor = .systemBackground
    }

}

