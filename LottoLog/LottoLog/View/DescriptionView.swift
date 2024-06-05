//
//  DescriptionView.swift
//  LottoLog
//
//  Created by Jisoo HAM on 6/5/24.
//

import UIKit

import SnapKit

class DescriptionView: UIView {
    
    let infoLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        lb.text = "당첨번호 안내"
        lb.textAlignment = .left
        return lb
    }()
    
    let dateLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .lightGray
        lb.font = .systemFont(ofSize: 13)
        lb.textAlignment = .right
        return lb
    }()
    
    let seperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let drawNumberLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.textColor = .systemYellow
        return lb
    }()
    
    let drawResultLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.text = " 당첨결과"
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureHierarchy() {
        [infoLabel, dateLabel, seperateBar, drawNumberLabel, drawResultLabel]
            .forEach { addSubview($0) }
    }
    
    private func configureLayout() {
        infoLabel.snp.makeConstraints { info in
            info.top.leading.equalToSuperview()
            info.height.equalTo(20)
            info.width.greaterThanOrEqualTo(80)
            info.trailing.greaterThanOrEqualTo(dateLabel).offset(30)
        }
        dateLabel.snp.makeConstraints { date in
            date.top.trailing.equalToSuperview()
            date.height.equalTo(20)
            date.width.greaterThanOrEqualTo(80)
        }
        seperateBar.snp.makeConstraints { bar in
            bar.top.equalTo(infoLabel.snp.bottom).offset(10)
            bar.leading.trailing.equalToSuperview()
            bar.height.equalTo(1)
        }
        drawNumberLabel.snp.makeConstraints { label in
            label.top.equalTo(seperateBar.snp.bottom).offset(30)
            label.trailing.equalTo(snp.centerX)
            label.bottom.equalToSuperview()
        }
        
        drawResultLabel.snp.makeConstraints { label in
            label.top.equalTo(seperateBar.snp.bottom).offset(30)
            label.leading.equalTo(snp.centerX)
            label.bottom.equalToSuperview()
        }
    }
    
    func configureUI(
        date: String,
        drawNumber: String
    ) {
        dateLabel.text = date
        drawNumberLabel.text = drawNumber
    }
    
}
