import CoreLocation

public final class GlobalVariable {
    
    public static let shared = GlobalVariable()
    
    public var location: CLLocationCoordinate2D?
}

