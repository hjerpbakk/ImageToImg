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
    public func optimizeImageInPlace(path: String) {
        let manager = NSFileManager.defaultManager()
        if (!manager.fileExistsAtPath(imageOptimPath)) {
            return
        }
        
        shell(imageOptimPath, path)
    }

    func shell(args: String...) {
        let task = NSTask()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
    }
}