//
//  ViewController.swift
//  stage1
//
//  Created by Новый пользователь on 02.10.2024.
//

/*
Пояснения:

1. Есть один ViewController, его backgroundColor = .white

2. На ViewController отображено два вложенных UIView - MainView (желтый) и RootView (зеленый).

3. Кнопки расположены на MainView, а сам MainView расположен на RootView, то есть на него нет ссылок в ViewController.

4. По нажатию на кнопки происходит смена backgroundColor у ViewController тремя разными способами - Delegate, Responder Chain и Closure.

То есть нажатие на кнопку с Delegate должно сменить белый бэкграунд ViewController на синим, на кнопку Responder Chain сменим цвет бэкграунда ViewController на циан (голубой), на кнопку Closure сменим цвет бэкграунда ViewController на серый.
*/

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let rootView = RootView(frame: .zero, mainView: MainView())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(rootView)
        addConstraints()
        
#warning("Норм так делать?")
        rootView.mainView.closureButtonAction = { self.view.backgroundColor = .gray}
        rootView.mainView.delegate = self
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate(
            [   rootView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                rootView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                rootView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                rootView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.backgroundColor = .cyan
    }
    
    @objc func handleResponderChain() {
        view.backgroundColor = .cyan
    }
}

// MARK: - ViewController + MainViewDelegate
extension ViewController: MainViewDelegate {
    func changeBackground(to color: UIColor) {
        print("Chain")
        view.backgroundColor = .blue
    }
}
