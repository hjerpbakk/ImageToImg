import Foundation
import AppKit

/// Uses `ImageOptim` to optimize the file size of images.
public class ImageOptimizer {
    public init() {
    }
    
    /// Optimizes the image with the given path using the `ImageOptim` service.
    ///
    /// :param: path Path of the image to be optimized.
    ///
    /// :returns: Returns true if the `ImageOptim` service was started successfully.
    public func optimizeImageInPlace(path: String) -> Bool {
        let url = NSURL(fileURLWithPath: path)?.absoluteURL
        
        let pasteBoard = NSPasteboard.pasteboardWithUniqueName()
        pasteBoard.clearContents()
        pasteBoard.writeObjects([url!])
        
        return NSPerformService("ImageOptimize", pasteBoard)
    }
}