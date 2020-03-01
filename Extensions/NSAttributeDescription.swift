//
//  Extensions/NSAttributeDescription.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import CoreData

extension NSAttributeDescription {
    public static func attributeDescription(isOptional: Bool = true, isTransient: Bool = false, name: String, allowsExternalBinaryDataStorage: Bool = false, attributeType: NSAttributeType = .binaryDataAttributeType, defaultValue: Any? = nil, preservesValueInHistoryOnDeletion: Bool = false) -> NSAttributeDescription {
        let attributeDescription: NSAttributeDescription = NSAttributeDescription()
        attributeDescription.isOptional = isOptional // NSPropertyDescription
        attributeDescription.isTransient = isTransient
        attributeDescription.name = name
        attributeDescription.allowsExternalBinaryDataStorage = allowsExternalBinaryDataStorage //NSAttributeDescription
        attributeDescription.attributeType = attributeType
        attributeDescription.defaultValue = defaultValue
        attributeDescription.preservesValueInHistoryOnDeletion = preservesValueInHistoryOnDeletion
        return attributeDescription
    }
}
