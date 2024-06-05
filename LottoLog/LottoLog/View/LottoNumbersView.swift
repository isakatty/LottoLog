//
//  LottoNumbersView.swift
//  LottoLog
//
//  Created by Jisoo HAM on 6/6/24.
//

import UIKit

import SnapKit

class LottoNumbersView: UIView {
    
    let numberStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 7
        return stack
    }()
    // MARK: 이렇게 생성하지 않고 만드는 방법 찾기
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
    
    var drawNumbers = [CircleView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        addSubview(numberStackView)
        
        [drawNo1, drawNo2, drawNo3, drawNo4,
         drawNo5, drawNo6, plusView, bonus]
            .forEach {
                numberStackView.addArrangedSubview($0)
                if $0 != plusView {
                    drawNumbers.append($0)
                }
            }
        
    }
    func configureLayout() {
        numberStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureUI(numbers: [Int]) {
        for (index, _) in numbers.enumerated() {
            drawNumbers[index].configureUI(number: numbers[index])
        }
    }
}
