import Cocoa

class ViewController: NSViewController {  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func ImageChanged(sender: InputImageView) {
        if (sender.droppedFilePath == nil) {
            return
        }
        
        let imageToImg = ImageToImg()
        imageToImg.optimizeImageAndPutImgOnPasteboard(sender.droppedFilePath!, image: sender.image!)
    }
}

