import Cocoa
import XCTest
import ImageToImg

class ImageOptimizerTests: XCTestCase {
    func optimizeImageInPlace_imageExistsAndImageOptimIsInstalled_runs() {
        let imageOptimizer = ImageOptimizer()
        
        imageOptimizer.optimizeImageInPlace("ImageToImgTests/star.png")
    }
}
