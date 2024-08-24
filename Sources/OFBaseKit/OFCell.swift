//
//  OFCell.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

class OFCell: UITableViewCell {

    var model: Any?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        setupCellUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        setupCellUI()
    }

    func setupCellUI() { }

    func setContent(_ anyModel: Any) { model = anyModel }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
