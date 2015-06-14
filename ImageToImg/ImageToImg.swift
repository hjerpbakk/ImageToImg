import Foundation
import AppKit

public class ImageToImg {
    public class func optimizeImageAndPutImgOnPasteboard(imagePath: String, image: NSImage) {
        NSDocumentController.sharedDocumentController().noteNewRecentDocumentURL(NSURL(fileURLWithPath: imagePath)!)
        
        let imageOptimizer = ImageOptimizer()
        imageOptimizer.optimizeImageInPlace(imagePath)
        
        let imageName = imagePath.lastPathComponent
        let htmlGenerator = HTMLGenerator()
        var html = htmlGenerator.imgHtml(imageName, width: image.size.width, height: image.size.height)
        
        var pboard = NSPasteboard.generalPasteboard()
        pboard.clearContents()
        pboard.writeObjects([html])
        
        NotificationCenter.notify("Img tag copied to the clipboard", message: "Ready to be pasted 🔗")
    }
}