//
//  OFItem.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

class OFItem: UICollectionViewCell {

    var model: Any?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupItemUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupItemUI()
    }

    func setupItemUI() { }

    func setContent(_ model: Any) { }

}
