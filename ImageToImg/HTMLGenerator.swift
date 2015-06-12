import Foundation

public class HTMLGenerator {
    let imageBasePath: String
    let textAlign: String
    
    public init() {
        imageBasePath = "../s/"
        textAlign = "center"
    }

    public func imgHtml(imageName: String, width: CGFloat, height: CGFloat) -> String {
        let imageUrl = imageBasePath + imageName
        return "<div style=\"width:100%; text-align:\(textAlign)\">\r\n\t<img src=\"\(imageUrl)\" alt=\"star\" width=\"\(width / 2)\" height=\"\(height / 2)\">\r\n</div>"
    }
}