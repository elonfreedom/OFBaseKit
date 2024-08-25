//
//  OFLabel.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

open class OFLabel: UILabel, UIPopoverPresentationControllerDelegate {

    public var insets: UIEdgeInsets = .zero {
        didSet {
            // 当 insets 变化时，重新布局
            setNeedsDisplay()
            invalidateIntrinsicContentSize()
        }
    }

    open var maxWidth: CGFloat = CGFloat.greatestFiniteMagnitude { //CGFloat.greatestFiniteMagnitude {
        didSet {
            setNeedsDisplay()
            invalidateIntrinsicContentSize()
        }
    }

    open var longPressEnable: Bool = false

    open var isTextTruncated: Bool {
        guard let text = self.text else { return false }
        let constrainedWidth = maxWidth - insets.left - insets.right
        let size = (text as NSString).boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.bounds.height),
            options: .usesLineFragmentOrigin,
            attributes: [.font: self.font ?? UIFont.systemFont(ofSize: 17)],
            context: nil
        ).size
        return size.width > constrainedWidth
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLongPressGesture()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLongPressGesture()
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = min(size.width + insets.left + insets.right, maxWidth)
        return CGSize(width: width, height: size.height + insets.top + insets.bottom)
    }

    public func setupLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(longPressGesture)
        self.isUserInteractionEnabled = true
    }

    @objc open func handleLongPress() {
        if isTextTruncated, longPressEnable {
            showFullText()
        }
    }

    public func showFullText() {
        guard let parentViewController = self.findViewController() else { return }

        let popoverContent = UIViewController()
        let label = UILabel()
        label.text = self.text
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = self.textColor
        label.font = self.font
        label.frame.size = CGSize(width: min(label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)).width, 300), height: label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)).height)

        popoverContent.view.addSubview(label)
        popoverContent.preferredContentSize = CGSize(width: label.frame.width + 20, height: label.frame.height + 20)

        let popoverController = popoverContent.popoverPresentationController
        popoverController?.sourceView = self
        popoverController?.sourceRect = self.bounds
        popoverController?.permittedArrowDirections = .down
        popoverController?.delegate = self

        popoverContent.modalPresentationStyle = .popover
        parentViewController.present(popoverContent, animated: true, completion: nil)
    }
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}
