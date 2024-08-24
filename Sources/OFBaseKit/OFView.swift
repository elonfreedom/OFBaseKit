//
//  OFView.swift
//  
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

public class OFView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public func setupUI() {}
    
    public func setContent(_ content: Any) {}

}
