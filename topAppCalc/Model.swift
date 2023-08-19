
import Foundation

enum Result: Codable{
    case noRoots
    case oneRoot(result: Float)
    case twoRoots(result1: Float, result2: Float)
}
