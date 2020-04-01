import Foundation

public extension String {
    func index(at i: Int) -> String.Index? {
        guard i < self.count else {
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

