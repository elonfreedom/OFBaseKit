//
//  OFView.swift
//  
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

open class OFView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    open func setupUI() {}
    
    open func setContent(_ content: Any) {}

}
