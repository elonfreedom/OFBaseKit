//
//  OFCell.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

open class OFCell: UITableViewCell {

    open var model: Any?

    open override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        setupCellUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        setupCellUI()
    }

    open func setupCellUI() { }

    open func setContent(_ anyModel: Any) { model = anyModel }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
