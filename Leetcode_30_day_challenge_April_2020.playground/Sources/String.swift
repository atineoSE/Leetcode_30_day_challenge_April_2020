import Foundation

public extension String {
    
    func index(from index: String.Index?, offsetBy: Int) -> String.Index? {
        guard let index = index else { return nil }
        
        var newIndex = index
        self.formIndex(&newIndex, offsetBy: offsetBy)
        return newIndex < endIndex ? newIndex : nil
    }
    
    func index(at i: Int) -> String.Index? {
        guard i < self.count && i >= 0 else {
            return nil
        }
        var index = self.startIndex
        formIndex(&index, offsetBy: i)
        return index
    }
    
    func string(at i: Int) -> String? {
        guard let index = index(at: i) else {
            return nil
        }
        
        return String(self[index])
    }
    
    subscript(i: Int) -> String? {
        return self.string(at: i)
    }
    
    func string(from i: Int, upTo j: Int) -> String? {
        guard let index1 = index(at: i) else {
            return nil
        }
        
        if let index2 = index(at: j) {
            return String(self[index1..<index2])
        } else if j == self.count {
            return String(self[index1...])
        } else {
            return nil
        }
    }
    
    subscript(r: Range<Int>) -> String? {
        return self.string(from: r.lowerBound, upTo: r.upperBound)
    }
}

