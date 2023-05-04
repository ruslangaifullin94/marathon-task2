//
//  ModalViewController.swift
//  2ndTask
//
//  Created by Руслан Гайфуллин on 04.05.2023.
//

import UIKit



class ModalViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        presentationController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension ModalViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//        print("i work")
//        mainView?.buttonChangeColorToNormal()
    }
}
