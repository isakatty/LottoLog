//
//  CircleView.swift
//  LottoLog
//
//  Created by Jisoo HAM on 6/5/24.
//

import UIKit

import SnapKit

class CircleView: UIView {
    public var drawLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = .boldSystemFont(ofSize: 14)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.width / 2
    }
    
    private func configureHierarchy() {
        addSubview(drawLabel)
    }
    
    private func configureLayout() {
        
        drawLabel.snp.makeConstraints { label in
            label.edges.equalToSuperview()
        }
    }
    
    public func configureUI(
        number: Int
    ) {
        backgroundColor = LottoColor.changeColor(with: number).color
        drawLabel.text = String(number)
    }
    
    public func plusUI(plus: String) {
        drawLabel.text = plus
    }
    
}
