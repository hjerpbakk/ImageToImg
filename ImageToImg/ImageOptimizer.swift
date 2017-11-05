import Foundation
import AppKit

/// Uses `ImageOptim` to optimize the file size of images.
open class ImageOptimizer {
    let imageOptimPath: String
    
    public init() {
        imageOptimPath = "/Applications/ImageOptim.app/Contents/MacOS/ImageOptim"
    }
    
    /// Optimizes the image with the given path using `ImageOptim`.
    ///
    /// - parameter path: Path of the image to be optimized.
    ///
    /// - returns: Returns true.
    open func optimizeImageInPlace(_ path: String) {
        let manager = FileManager.default
        if (!manager.fileExists(atPath: imageOptimPath)) {
            return
        }
        
        shell(imageOptimPath, path)
    }

    func shell(_ args: String...) {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
    }
}
