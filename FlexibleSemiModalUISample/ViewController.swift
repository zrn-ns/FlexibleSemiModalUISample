//
//  ViewController.swift
//  FlexibleSemiModalUISample
//
//  Created by zrn_ns on 2022/12/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func tappedCheckoutButton(_ sender: Any) {
        let paymentVC = PaymentViewController()
        paymentVC.modalPresentationStyle = .pageSheet
        paymentVC.tappedCancelHandler = {
            paymentVC.dismiss(animated: true)
        }
        present(paymentVC, animated: true)
    }
}

