//
//  PaymentView.swift
//  FlexibleSemiModalUISample
//
//  Created by zrn_ns on 2022/12/10.
//

import Foundation
import UIKit

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
