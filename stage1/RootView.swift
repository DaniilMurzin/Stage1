//
//  RootView.swift
//  stage1
//
//  Created by Новый пользователь on 02.10.2024.
//

import UIKit

class RootView: UIView {
    
    let mainView: MainView
    
    init(frame: CGRect, mainView: MainView) {
        self.mainView = mainView
        super.init(frame: frame)
        addSubview(mainView)
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            mainView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
