//
//  PaymentView.swift
//  FlexibleSemiModalUISample
//
//  Created by zrn_ns on 2022/12/10.
//

import Foundation
import UIKit

final class PaymentViewController: UIViewController {

    var tappedCancelHandler: (() -> Void)?

    override func loadView() {
        self.view = UIView()

        // 背景は透過する
        view.backgroundColor = .clear

        // 背景タップ時、キャンセル扱いにする
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedBackground)))

        // セミモーダル表示するビューを生成して、addSubviewする
        let paymentView = PaymentView()
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(paymentView)
        view.addConstraints([
            paymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            paymentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        // PaymentView自体のタップは処理しない
        paymentView.addGestureRecognizer(UITapGestureRecognizer())

        // 角丸設定
        paymentView.layer.cornerRadius = 10
        paymentView.layer.masksToBounds = true
        paymentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        paymentView.tappedCancelHandler = { [weak self] in
            self?.tappedCancelHandler?()
        }
    }

    @objc private func tappedBackground() {
        tappedCancelHandler?()
    }
}

final class PaymentView: UIView {

    var tappedCancelHandler: (() -> Void)?

    // MARK: - initializer

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    convenience init() {
        self.init(frame: .zero)
    }

    private func loadNib(){
        let className: String = .init(describing: type(of: self))
        let view = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

    @IBAction private func tappedCancel(_ sender: Any) {
        tappedCancelHandler?()
    }
}
