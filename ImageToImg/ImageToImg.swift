import Foundation
import AppKit

public class ImageToImg {
    public init() {
    }

    public func optimizeImageAndPutImgOnPasteboard(imagePath: String, image: NSImage) {
        let imageOptimizer = ImageOptimizer()
        imageOptimizer.optimizeImageInPlace(imagePath)
        
        let imageName = imagePath.lastPathComponent
        let htmlGenerator = HTMLGenerator()
        var html = htmlGenerator.imgHtml(imageName, width: image.size.width, height: image.size.height)
        
        var pboard = NSPasteboard.generalPasteboard()
        pboard.clearContents()
        pboard.writeObjects([html])
        
        // TODO: Show notification if allowed
    }
    
}