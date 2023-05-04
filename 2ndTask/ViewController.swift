//
//  ViewController.swift
//  2ndTask
//
//  Created by Руслан Гайфуллин on 04.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstButton: UIButton = {
        
        var firstConfig = UIButton.Configuration.filled()
        firstConfig.title = "First Button"
        firstConfig.image = UIImage(systemName: "arrowshape.turn.up.right.circle.fill")
        firstConfig.imagePlacement = .trailing
        firstConfig.imagePadding = 8
        firstConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        firstConfig.cornerStyle = .medium
        let button = UIButton(configuration: firstConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        var secondConfig = UIButton.Configuration.filled()
        secondConfig.title = "Second Medium Button"
        secondConfig.image = UIImage(systemName: "arrowshape.turn.up.right.circle.fill")
        secondConfig.imagePlacement = .trailing
        secondConfig.imagePadding = 8
        secondConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        secondConfig.cornerStyle = .medium
        
        let button = UIButton(configuration: secondConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var thirdButton: UIButton = {
        var thirdConfig = UIButton.Configuration.filled()
        thirdConfig.title = "Third"
        thirdConfig.image = UIImage(systemName: "arrowshape.turn.up.right.circle.fill")
        thirdConfig.imagePlacement = .trailing
        thirdConfig.imagePadding = 8
        thirdConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        thirdConfig.cornerStyle = .medium
        
        let button = UIButton(configuration: thirdConfig)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapThirdButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraits()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        firstButton.addTargetToButtonForAnimation()
        secondButton.addTargetToButtonForAnimation()
        thirdButton.addTargetToButtonForAnimation()
    }
    
    
    
    private func setupConstraits() {
        let safeArea = view.safeAreaLayoutGuide
       
        
        
        NSLayoutConstraint.activate([
            
            firstButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            firstButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
            
        ])
        
    }
    
    @objc private func didTapThirdButton() {
        let modalVC = ModalViewController()
        modalVC.modalTransitionStyle = .coverVertical
        modalVC.modalPresentationStyle = .pageSheet
        modalVC.view.backgroundColor = .white
        navigationController?.present(modalVC, animated: true)
    }
  
}

extension UIButton {
    func addTargetToButtonForAnimation() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.6, y: 0.6))
    }

    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }

    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: .curveEaseInOut,
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
}
