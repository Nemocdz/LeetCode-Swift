import Cocoa

/*
 在二维平面上计算出两个由直线构成的矩形重叠后形成的总面积。

 每个矩形由其左下顶点和右上顶点坐标表示，如图所示。
 示例:

 输入: -3, 0, 3, 4, 0, -1, 9, 2
 输出: 45
 说明: 假设矩形面积不会超出 int 的范围。
 */

class Solution {
    struct Rect {
        let minX:Int
        let maxX:Int
        let minY:Int
        let maxY:Int
        
        init(leftBottom:(Int, Int), rightTop:(Int, Int)) {
            minX = leftBottom.0
            minY = leftBottom.1
            maxX = rightTop.0
            maxY = rightTop.1
        }
        
        var area:Int {
            let width = maxX - minX
            let height = maxY - minY
            return width * height
        }
    }
    
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        let a = Rect(leftBottom: (A, B), rightTop: (C, D))
        let b = Rect(leftBottom: (E, F), rightTop: (G, H))
        
        if !(a.maxX < b.minX || a.maxY < b.minY || a.minX > b.maxX || a.minY > b.maxY) {
            let leftX = max(a.minX, b.minX)
            let topY = min(a.maxY, b.maxY)
            let rightX = min(a.maxX, b.maxX)
            let bottomY = max(a.minY, b.minY)
            
            let area = (rightX - leftX) * (topY - bottomY)
            
            return a.area - area + b.area
        }
        return a.area + b.area
    }
}
