//
//  Config.swift
//  streak
//
//  Created by Jared Bourgeois on 9/19/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import Foundation
import UIKit

public struct UIButtonSetupModel {
    public let backgroundColor: UIColor
    public let cornerRadius: CGFloat
    public let frame: CGRect
    public let height: CGFloat
    public let showsTouchWhenHighlighted: Bool
    public let labelSetupModel: UILabelSetupModel
    public let target: Any?
    public let selector: Selector?
    public let controlEvent: UIControl.Event
    
    public static let empty = UIButtonSetupModel()
    
    public init(
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
    
    public init(
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

public struct UILabelSetupModel {
    public let backgroundColor: UIColor
    public let cornerRadius: CGFloat
    public let font: UIFont
    public let frame: CGRect
    public let height: CGFloat
    public let numberOfLines: Int
    public let textAlignment: NSTextAlignment
    public let textColor: UIColor
    public let text: String
    
    public static let empty = UILabelSetupModel()
    
    public init(
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
    
    public init(
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

public struct UIScrollViewSetupModel {
    public let delegate: UIScrollViewDelegate?
    public let frame: CGRect
    public let isScrollEnabled: Bool
    public let cornerRadius: CGFloat
    public let backgroundColor: UIColor
    public let showsVerticalScrollIndicator: Bool
    public let indicatorStyleMatchColor: UIColor
    public let indicatorStyleMatchesColor: Bool
    
    public static let empty = UIScrollViewSetupModel()
    
    public init(
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
    
    public init(
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

public struct UITextFieldSetupModel {
    public let backgroundColor: UIColor
    public let cornerRadius: CGFloat
    public let delegate: UITextFieldDelegate?
    public let font: UIFont
    public let frame: CGRect
    public let height: CGFloat
    public let isUserInteractionEnabled: Bool
    public let keyboardType: UIKeyboardType
    public let placeholder: String
    public let placeholderColor: UIColor
    public let textAlignment: NSTextAlignment
    public let textColor: UIColor
    public let text: String
    
    public static let empty = UITextFieldSetupModel()
    
    public init(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = .zero,
        delegate: UITextFieldDelegate? = nil,
        font: UIFont = .system,
        frame: CGRect = .zero,
        height: CGFloat = .zero,
        isUserInteractionEnabled: Bool = false,
        keyboardType: UIKeyboardType = .default,
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
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.text = text
    }

    public init(
        setupModel: UITextFieldSetupModel? = nil,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil,
        delegate: UITextFieldDelegate? = nil,
        font: UIFont? = nil,
        frame: CGRect? = nil,
        height: CGFloat? = nil,
        isUserInteractionEnabled: Bool? = nil,
        keyboardType: UIKeyboardType? = nil,
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
        self.keyboardType = keyboardType ?? .default
        self.placeholder = placeholder ?? setupModel.placeholder
        self.placeholderColor = placeholderColor ?? setupModel.placeholderColor
        self.textAlignment = textAlignment ?? setupModel.textAlignment
        self.textColor = textColor ?? setupModel.textColor
        self.text = text ?? setupModel.text
    }
}

public struct UITextViewSetupModel {
    public let backgroundColor: UIColor
    public let cornerRadius: CGFloat
    public let font: UIFont
    public let frame: CGRect
    public let height: CGFloat
    public let isEditable: Bool
    public let isScrollEnabled: Bool
    public let isUserInteractionEnabled: Bool
    public let textAlignment: NSTextAlignment
    public let textColor: UIColor
    public let text: String

    public static let empty = UITextViewSetupModel()
    
    public init(
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
    
    public init(
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
