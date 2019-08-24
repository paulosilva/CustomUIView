//
//  CUIView.swift
//  CustomUIView
//
//  Created by Paulo Silva on 23/08/2019.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

@IBDesignable class CUIView: UIView {
    
    // MARK: - Private Variables -
    
    private let containerView = UIView()
    private var containerImageView = UIImageView()
    
    // MARK: - Public Attributes -
    
    @IBInspectable public var backgroundImage: UIImage? {
        get {
            return self.containerImageView.image
        }
        set {
//            addShadowColorFromBackgroundImage()
            self.containerImageView.image = newValue
        }
    }
    
    override open var backgroundColor: UIColor? {
        didSet(new) {
            if let color = new {
                containerView.backgroundColor = color
            }
            if backgroundColor != UIColor.clear { backgroundColor = UIColor.clear }
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.containerView.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
            self.containerView.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.containerView.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            self.containerView.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.containerView.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.containerView.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
//    @IBInspectable var shadowColorFormImage: Bool = false {
//        didSet {
//            addShadowColorFromBackgroundImage()
//        }
//    }
    
    // MARK: - Life Cycle -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViewLayoutSubViews()
        refreshViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViewLayoutSubViews()
        refreshViewLayout()
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        refreshViewLayout()
//        addShadowColorFromBackgroundImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        refreshViewLayout()
//        addShadowColorFromBackgroundImage()
    }
    
    // MARK: - Private Methods -
    
    private func refreshViewLayout() {
        // View
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        
        // Shadow
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        
        // Container View
        self.containerView.layer.masksToBounds = true
        self.containerView.layer.cornerRadius = cornerRadius
        
        // Image View
        self.containerImageView.backgroundColor = UIColor.clear
        self.containerImageView.image = backgroundImage
        self.containerImageView.layer.cornerRadius = cornerRadius
        self.containerImageView.layer.masksToBounds = true
        self.containerImageView.clipsToBounds = true
        self.containerImageView.contentMode = .redraw
    }
    
    private func addViewLayoutSubViews() {
        // add subViews
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.containerImageView)
        
        // add image constraints
        self.containerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.containerImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.containerImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.containerImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.containerImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // add view constraints
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
//    private func addShadowColorFromBackgroundImage() {
//        // Get the averageColor from the image for set the Shadow Color
//        if shadowColorFormImage {
//            let week = self
//            DispatchQueue.main.async {
//                week.shadowColor = (week.containerImageView.image?.averageColor)!
//            }
//        }
//    }
}
