import Cocoa

class ViewController: NSViewController {
    let imageToImg: ImageToImg
    
    required init?(coder: NSCoder) {
        imageToImg = ImageToImg()
        super.init(coder: coder);
    }
    
    @IBAction func ImageChanged(sender: InputImageView) {
        if (sender.droppedFilePath == nil) {
            return
        }
        
        imageToImg.optimizeImageAndPutImgOnPasteboard(sender.droppedFilePath!, image: sender.image!)
    }
}

