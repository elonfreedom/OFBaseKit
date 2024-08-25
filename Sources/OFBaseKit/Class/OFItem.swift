//
//  OFItem.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

open class OFItem: UICollectionViewCell {

    open var model: Any?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupItemUI()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupItemUI()
    }

    open func setupItemUI() { }

    open func setContent(_ model: Any) { }

}
