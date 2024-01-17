import miamCore

public struct MealzUIModuleIOS {
    public private(set) var text = "Hello, World!"

    public init() {}
    
    public static var bundle: Bundle {
       return Bundle.module
    }
}

