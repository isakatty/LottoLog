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
    
    lazy var chooseTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "회차를 입력하세요."
        tf.borderStyle = .roundedRect
        tf.inputView = datePicker
        tf.tintColor = .clear
        return tf
    }()
    
    let datePicker = UIPickerView()
    
    let numberStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 7
        return stack
    }()
    let lottoNumbersView = LottoNumbersView()
    let descriptionView = DescriptionView()
    
    // pickerview에서 선택할 요소인데, 값이 바뀔때 어떻게 가져올 수 있지 ?
    let list: [String] = ["1110","1111","1112","1113","1114","1115","1116","1117","1118","1119", "1120", "1121", "1122"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configurePicker()
    }
    
    func networking(selected: String) {
        let url = privateKey.lottoURL + selected
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let lotto):
                self.lottoNumbersView.configureUI(numbers: lotto.drawNumbers)
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
        
        [chooseTextField, descriptionView, lottoNumbersView]
            .forEach { view.addSubview($0) }
        
    }
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        chooseTextField.snp.makeConstraints { make in
            make.top.equalTo(safeArea).offset(30)
            make.leading.trailing.equalTo(safeArea).inset(15)
            make.height.equalTo(40)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(chooseTextField.snp.bottom).offset(30)
            make.centerX.equalTo(safeArea)
            make.leading.trailing.equalTo(safeArea).inset(15)
            make.width.greaterThanOrEqualTo(80)
        }
        
        lottoNumbersView.snp.makeConstraints { make in
            make.centerX.equalTo(safeArea)
            make.top.equalTo(descriptionView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(safeArea).inset(15)
            make.height.equalTo(40)
        }
        
    }
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    func configurePicker() {
        datePicker.delegate = self
        datePicker.dataSource = self
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        return list.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        return "\(list[row]) 회차"
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        networking(selected: list[row])
        chooseTextField.text = list[row] + " 회차"
    }
}

