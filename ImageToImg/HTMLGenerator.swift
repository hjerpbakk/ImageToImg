import Foundation

public class HTMLGenerator {
    let imageBasePath: String
    let textAlign: String
    
    public init() {
        imageBasePath = "http://hjerpbakk.com/s/"
        textAlign = "center"
    }

    public func imgHtml(imageName: String, width: CGFloat, height: CGFloat) -> String {
        let imageUrl = imageBasePath + imageName.stringByReplacingOccurrencesOfString(" ", withString: "-")
        return "<div style=\"width:100%; text-align:\(textAlign)\">\r\n\t<img src=\"\(imageUrl)\" alt=\"\((imageName as NSString).stringByDeletingPathExtension)\" width=\"\(formatNumber(width / 2))\" height=\"\(formatNumber(height / 2))\">\r\n</div>"
    }
    
    func formatNumber(number: CGFloat) -> NSString {
        return (NSString(format: "%.01f", number))
    }
}