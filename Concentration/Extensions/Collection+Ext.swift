
import Foundation

extension Collection {
    var oneAndOnlyIndex : Element? {
        count == 1 ? first : nil
    }
}
