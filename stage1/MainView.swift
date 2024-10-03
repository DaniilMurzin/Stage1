//
//  MainView.swift
//  stage1
//
//  Created by Новый пользователь on 02.10.2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func changeBackground(to color: UIColor)
}

class MainView: UIView {
    
    // MARK: - Properties
    weak var delegate: MainViewDelegate?
    var closureButtonAction: (() -> Void)?
    
    // MARK: - IO
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually 
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let delegateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Blue Delegate", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(delegateButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.setTitleColor(.yellow, for: .normal)
        return button
    }()
    
    private let responderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cyan Responder Chain", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.setTitleColor(.yellow, for: .normal)
        button.addTarget(self, action: #selector(responderButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let closureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Closure Example", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.yellow, for: .normal)
        button.addTarget(self, action: #selector(closureButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        buttonStackView.addArrangedSubview(delegateButton)
        buttonStackView.addArrangedSubview(responderButton)
        buttonStackView.addArrangedSubview(closureButton)
        
        addSubview(buttonStackView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods 
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            buttonStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
    
    @objc private func closureButtonTapped() {
        closureButtonAction?()
    }
    
    @objc private func delegateButtonTapped() {
        delegate?.changeBackground(to: .blue)
    }
    
    #warning("По другому не знаю как сделать")
    @objc private func responderButtonTapped() {
        UIApplication.shared.sendAction(#selector(ViewController.handleResponderChain), to: nil, from: self, for: nil)

    }
}
