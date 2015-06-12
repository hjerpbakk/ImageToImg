import Foundation
import AppKit

/// Uses `ImageOptim` to optimize the file size of images.
public class ImageOptimizer {
    let imageOptimPath: String
    
    public init() {
        imageOptimPath = "/Applications/ImageOptim.app/Contents/MacOS/ImageOptim"
    }
    
    /// Optimizes the image with the given path using `ImageOptim`.
    ///
    /// :param: path Path of the image to be optimized.
    ///
    /// :returns: Returns true.
    public func optimizeImageInPlace(path: String) -> Bool {
        shell(imageOptimPath, path)
 
        // TODO: What if imageoptim is not installed?
        return true
    }

    func shell(args: String...) {
        let task = NSTask()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
    }
}