//
//  PTCSegmentControll.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

protocol PTCSegmentControllDelegate: AnyObject {
    func didSelect(_ index: Int)
}

class PTCSegmentControll: UIView {
    
    lazy var hStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fillEqually
        return s
    }()
    
    lazy var selectorView: UIView = {
        let selectorWidth = UIScreen.main.bounds.width / CGFloat(self.buttonTitles.count)
        let sv = UIView(frame: CGRect(x: 0, y: height-2, width: selectorWidth, height: 2))
        sv.backgroundColor = selectorViewColor
        return sv
    }()
   
    private var buttons: [UIButton]!
    
    private var buttonTitles:[String]!
    var textColor:UIColor = .gray
    var selectorViewColor: UIColor = .orange
    var selectorTextColor: UIColor = .orange
    private let height: CGFloat
    
    weak var delegate: PTCSegmentControllDelegate?
    
    public private(set) var selectedIndex : Int = 0
    
    required init(buttonTitle: [String], height: CGFloat) {
        self.buttonTitles = buttonTitle
        self.height = height
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIndex(index:Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        
        let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    @objc func didTapButton(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.didSelect(selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}


extension PTCSegmentControll: ViewCoding {
    func buildViewHierarchy() {
        buttons = createButtons()
        buttons.forEach({ hStack.addArrangedSubview($0)})
        
        addSubview(hStack)
        addSubview(selectorView)
    }
    
    func setupConstraints() {
        hStack.fillSuperview()
    }
    
    private func createButtons() -> [UIButton] {
        var buttons = [UIButton]()
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action:#selector(didTapButton(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        return buttons
    }
}
