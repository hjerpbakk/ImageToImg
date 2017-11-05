import Foundation

open class HTMLGenerator {
    let imageBasePath: String
    let textAlign: String
    
    public init() {
        imageBasePath = "http://hjerpbakk.com/s/"
        textAlign = "center"
    }

    open func imgHtml(_ imageName: String, width: CGFloat, height: CGFloat) -> String {
        let imageUrl = imageBasePath + imageName.replacingOccurrences(of: " ", with: "-")
        return "<div style=\"width:100%; text-align:\(textAlign)\">\r\n\t<img src=\"\(imageUrl)\" alt=\"\((imageName as NSString).deletingPathExtension)\" width=\"\(formatNumber(width / 2))\">\r\n</div>"
    }
    
    func formatNumber(_ number: CGFloat) -> NSString {
        return (NSString(format: "%.01f", number))
    }
}
