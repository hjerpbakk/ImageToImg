import Cocoa
import XCTest
import ImageToImg

class HTMLGeneratorTests: XCTestCase {
    func testExample() {
        let htmlGenerator = HTMLGenerator()
        
        let img = htmlGenerator.imgHtml("star.png", width: 200, height: 100)

        XCTAssertEqual("<div style=\"width:100%; text-align:center\">\r\n\t<img src=\"http://hjerpbakk.com/s/star.png\" alt=\"star\" width=\"100.0\" height=\"50.0\">\r\n</div>", img)
        
    }
}