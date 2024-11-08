import UIKit

// Subscripts (Sub índices)

struct TimesTable {
    let multiplayer: Int
    
    subscript(index: Int) -> Int {
        return multiplayer * index
    }
}

let threeTimesTable = TimesTable(multiplayer: 3)
print(threeTimesTable[0])
print(threeTimesTable[1])
print(threeTimesTable[2])
print(threeTimesTable[3])

for index in 0..<10 {
    print("3 x \(index) = \(threeTimesTable[index])")
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        if let planet = Planet(rawValue: n) {
            return planet
        } else {
            return .earth
        }
    }
}

let mars = Planet[4]
print(mars)
print(Planet[4])


// Matrix

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
     subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 3)
matrix[0, 0] = 1
matrix[0, 1] = 2
matrix[0, 2] = 3
matrix[1, 0] = 4
matrix[1, 1] = 5
matrix[1, 2] = 6

print(matrix)

