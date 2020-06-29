import UIKit

class FieldObject {
    let text = "field object text"
}

class Singleton {
    private static weak var _weakBackingField: FieldObject?
    public static var weakField: FieldObject {
        guard let field = _weakBackingField else {
            let field = FieldObject()
            _weakBackingField = field
            return field
        }
        return field
    }
    public static func printWeakBackingFieldText() {
        print(_weakBackingField?.text ?? "nil")
    }
    
    private static var _strongBackingField: FieldObject?
    public static var strongField: FieldObject {
        guard let field = _strongBackingField else {
            let field = FieldObject()
            _strongBackingField = field
            return field
        }
        return field
    }
    public static func printStrongBackingFieldText() {
        print(_strongBackingField?.text ?? "nil")
    }
}

print("weak")
Singleton.printWeakBackingFieldText()
var weakFieldExternalReference: FieldObject? = Singleton.weakField
Singleton.printWeakBackingFieldText()
weakFieldExternalReference = nil
Singleton.printWeakBackingFieldText()
print("\n")
print("strong")
Singleton.printStrongBackingFieldText()
var strongFieldExternalReference: FieldObject? = Singleton.strongField
Singleton.printStrongBackingFieldText()
strongFieldExternalReference = nil
Singleton.printStrongBackingFieldText()

