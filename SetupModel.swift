//
//  Config.swift
//  streak
//
//  Created by Jared Bourgeois on 9/19/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import Foundation
import UIKit

struct UIButtonSetupModel {
    
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let frame: CGRect
    let height: CGFloat
    let showsTouchWhenHighlighted: Bool
    let labelSetupModel: UILabelSetupModel
    let target: Any?
    let selector: Selector?
    let controlEvent: UIControl.Event
    
    static let empty = UIButtonSetupModel()
    
    init(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = .zero,
        frame: CGRect = .zero,
        height: CGFloat = .zero,
        showsTouchWhenHighlighted: Bool = true,
        labelSetupModel: UILabelSetupModel = .empty,
        target: Any? = nil,
        selector: Selector? = nil,
        controlEvent: UIControl.Event = .touchUpInside
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.frame = frame
        self.height = height
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        self.labelSetupModel = labelSetupModel
        self.target = target
        self.selector = selector
        self.controlEvent = controlEvent
    }
    
    init(
        setupModel: UIButtonSetupModel? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil,
        frame: CGRect? = nil,
        height: CGFloat? = nil,
        showsTouchWhenHighlighted: Bool? = nil,
        labelSetupModel: UILabelSetupModel? = nil,
        target: Any? = nil,
        selector: Selector? = nil,
        controlEvent: UIControl.Event? = nil
    ) {
        let setupModel = setupModel ?? .empty
        self.backgroundColor = backgroundColor ?? setupModel.backgroundColor
        self.cornerRadius = cornerRadius ?? setupModel.cornerRadius
        self.frame = frame ?? setupModel.frame
        self.height = height ?? setupModel.height
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted ?? setupModel.showsTouchWhenHighlighted
        self.labelSetupModel = labelSetupModel ?? setupModel.labelSetupModel
        self.target = target ?? setupModel.target
        self.selector = selector ?? setupModel.selector
        self.controlEvent = controlEvent ?? setupModel.controlEvent
    }
}

struct UILabelSetupModel {
    
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let font: UIFont
    let frame: CGRect
    let height: CGFloat
    let numberOfLines: Int
    let textAlignment: NSTextAlignment
    let textColor: UIColor
    let text: String
    
    static let empty = UILabelSetupModel()
    
    init(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = .zero,
        font: UIFont = .system,
        frame: CGRect = .zero,
        height: CGFloat = .zero,
        numberOfLines: Int = 1,
        textAlignment: NSTextAlignment = .left,
        textColor: UIColor = .black,
        text: String = .empty
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.frame = frame
        self.height = height
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.text = text
    }
    
    init(
        setupModel: UILabelSetupModel? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil,
        font: UIFont? = nil,
        frame: CGRect? = nil,
        height: CGFloat? = nil,
        numberOfLines: Int? = nil,
        textAlignment: NSTextAlignment? = nil,
        textColor: UIColor? = nil,
        text: String? = nil
    ) {
        let setupModel = setupModel ?? .empty
        self.backgroundColor = backgroundColor ?? setupModel.backgroundColor
        self.cornerRadius = cornerRadius ?? setupModel.cornerRadius
        self.font = font ?? setupModel.font
        self.frame = frame ?? setupModel.frame
        self.height = height ?? setupModel.height
        self.numberOfLines = numberOfLines ?? setupModel.numberOfLines
        self.textAlignment = textAlignment ?? setupModel.textAlignment
        self.textColor = textColor ?? setupModel.textColor
        self.text = text ?? setupModel.text
    }
}

struct UIScrollViewSetupModel {
    
    let delegate: UIScrollViewDelegate?
    let frame: CGRect
    let isScrollEnabled: Bool
    let cornerRadius: CGFloat
    let backgroundColor: UIColor
    let showsVerticalScrollIndicator: Bool
    let indicatorStyleMatchColor: UIColor
    let indicatorStyleMatchesColor: Bool
    
    static let empty = UIScrollViewSetupModel()
    
    init(
        delegate: UIScrollViewDelegate? = nil,
        frame: CGRect = .zero,
        isScrollEnabled: Bool = true,
        cornerRadius: CGFloat = .zero,
        backgroundColor: UIColor = .clear,
        showsVerticalScrollIndicator: Bool = true,
        indicatorStyleMatchColor: UIColor = .black,
        indicatorStyleMatchesColor: Bool = true
    ) {
        self.delegate = delegate
        self.frame = frame
        self.isScrollEnabled = isScrollEnabled
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        self.indicatorStyleMatchColor = indicatorStyleMatchColor
        self.indicatorStyleMatchesColor = indicatorStyleMatchesColor
    }
    
    init(
        setupModel: UIScrollViewSetupModel? = nil,
        delegate: UIScrollViewDelegate? = nil,
        frame: CGRect? = nil,
        isScrollEnabled: Bool? = nil,
        cornerRadius: CGFloat? = nil,
        backgroundColor: UIColor? = nil,
        showsVerticalScrollIndicator: Bool? = nil,
        indicatorStyleMatchColor: UIColor? = nil,
        indicatorStyleMatchesColor: Bool? = nil
    ) {
        let setupModel = setupModel ?? .empty
        self.delegate = delegate ?? setupModel.delegate
        self.frame = frame ?? setupModel.frame
        self.isScrollEnabled = isScrollEnabled ?? setupModel.isScrollEnabled
        self.cornerRadius = cornerRadius ?? setupModel.cornerRadius
        self.backgroundColor = backgroundColor ?? setupModel.backgroundColor
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator ?? setupModel.showsVerticalScrollIndicator
        self.indicatorStyleMatchColor = indicatorStyleMatchColor ?? setupModel.indicatorStyleMatchColor
        self.indicatorStyleMatchesColor = indicatorStyleMatchesColor ?? setupModel.indicatorStyleMatchesColor
    }
}

struct UITextFieldSetupModel {
    
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let delegate: UITextFieldDelegate?
    let font: UIFont
    let frame: CGRect
    let height: CGFloat
    let isUserInteractionEnabled: Bool
    let placeholder: String
    let placeholderColor: UIColor
    let textAlignment: NSTextAlignment
    let textColor: UIColor
    let text: String
    
    static let empty = UITextFieldSetupModel()
    
    init(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = .zero,
        delegate: UITextFieldDelegate? = nil,
        font: UIFont = .system,
        frame: CGRect = .zero,
        height: CGFloat = .zero,
        isUserInteractionEnabled: Bool = false,
        placeholder: String = .empty,
        placeholderColor: UIColor = .black,
        textAlignment: NSTextAlignment = .left,
        textColor: UIColor = .black,
        text: String = .empty
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.delegate = delegate
        self.font = font
        self.frame = frame
        self.height = height
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.text = text
    }

    init(
        setupModel: UITextFieldSetupModel? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil,
        delegate: UITextFieldDelegate? = nil,
        font: UIFont? = nil,
        frame: CGRect? = nil,
        height: CGFloat? = nil,
        isUserInteractionEnabled: Bool? = nil,
        placeholder: String? = nil,
        placeholderColor: UIColor? = nil,
        textAlignment: NSTextAlignment? = nil,
        textColor: UIColor? = nil,
        text: String? = nil
    ) {
        let setupModel = setupModel ?? .empty
        self.backgroundColor = backgroundColor ?? setupModel.backgroundColor
        self.cornerRadius = cornerRadius ?? setupModel.cornerRadius
        self.delegate = delegate ?? setupModel.delegate
        self.font = font ?? setupModel.font
        self.frame = frame ?? setupModel.frame
        self.height = height ?? setupModel.height
        self.isUserInteractionEnabled = isUserInteractionEnabled ?? setupModel.isUserInteractionEnabled
        self.placeholder = placeholder ?? setupModel.placeholder
        self.placeholderColor = placeholderColor ?? setupModel.placeholderColor
        self.textAlignment = textAlignment ?? setupModel.textAlignment
        self.textColor = textColor ?? setupModel.textColor
        self.text = text ?? setupModel.text
    }
}

struct UITextViewSetupModel {
    
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let font: UIFont
    let frame: CGRect
    let height: CGFloat
    let isEditable: Bool
    let isScrollEnabled: Bool
    let isUserInteractionEnabled: Bool
    let textAlignment: NSTextAlignment
    let textColor: UIColor
    let text: String

    static let empty = UITextViewSetupModel()
    
    init(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = .zero,
        font: UIFont = .system,
        frame: CGRect = .zero,
        height: CGFloat = .zero,
        isEditable: Bool = false,
        isScrollEnabled: Bool = false,
        isUserInteractionEnabled: Bool = false,
        textAlignment: NSTextAlignment = .left,
        textColor: UIColor = .black,
        text: String = .empty
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.frame = frame
        self.height = height
        self.isEditable = isEditable
        self.isScrollEnabled = isScrollEnabled
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.text = text
    }
    
    init(
        setupModel: UITextViewSetupModel? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil,
        font: UIFont? = nil,
        frame: CGRect? = nil,
        height: CGFloat? = nil,
        isEditable: Bool? = nil,
        isScrollEnabled: Bool? = nil,
        isUserInteractionEnabled: Bool? = nil,
        textAlignment: NSTextAlignment? = nil,
        textColor: UIColor? = nil,
        text: String? = nil
    ) {
        let setupModel = setupModel ?? .empty
        self.backgroundColor = backgroundColor ?? setupModel.backgroundColor
        self.cornerRadius = cornerRadius ?? setupModel.cornerRadius
        self.font = font ?? setupModel.font
        self.frame = frame ?? setupModel.frame
        self.height = height ?? setupModel.height
        self.isEditable = isEditable ?? setupModel.isEditable
        self.isScrollEnabled = isScrollEnabled ?? setupModel.isScrollEnabled
        self.isUserInteractionEnabled = isUserInteractionEnabled ?? setupModel.isUserInteractionEnabled
        self.textAlignment = textAlignment ?? setupModel.textAlignment
        self.textColor = textColor ?? setupModel.textColor
        self.text = text ?? setupModel.text
    }
}
