import Cocoa
import XCTest
import ImageToImg

class ImageOptimizerTests: XCTestCase {
    func optimizeImageInPlace_imageExistsAndImageOptimIsInstalled_runs() {
        let imageOptimizer = ImageOptimizer()
        
        let succeeded = imageOptimizer.optimizeImageInPlace("ImageToImgTests/star.png")
        
        XCTAssert(succeeded)
    }
}
