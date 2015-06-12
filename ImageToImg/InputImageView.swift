//
//  InputImageView.swift
//  ImageToImg
//
//  Created by Runar Ovesen Hjerpbakk on 12/06/15.
//  Copyright (c) 2015 Runar Ovesen Hjerpbakk. All rights reserved.
//

import Cocoa

class InputImageView: NSImageView, NSDraggingDestination {
    //override func drawRect(dirtyRect: NSRect) {
    //    super.drawRect(dirtyRect)
    //}
    
    let fileTypes = ["jpg", "jpeg", "bmp", "png", "gif"]
    var fileTypeIsOk = false
    var droppedFilePath: String?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerForDraggedTypes([NSFilenamesPboardType, NSURLPboardType, NSPasteboardTypeTIFF])
    }
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        if isImage(sender) {
            self.fileTypeIsOk = true
            return .Copy
        } else {
            self.fileTypeIsOk = false
            return .None
        }
    }
    
    override func draggingUpdated(sender: NSDraggingInfo) -> NSDragOperation {
        if self.fileTypeIsOk {
            return .Copy
        } else {
            return .None
        }
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        if let board = sender.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? NSArray {
            if let imagePath = board[0] as? String {
                // THIS IS WERE YOU GET THE PATH FOR THE DROPPED FILE
                self.droppedFilePath = imagePath
                return true
            }
        }
        return false
    }
    
    func isImage(drag: NSDraggingInfo) -> Bool {
        if let board = drag.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? NSArray {
            if let url = NSURL(fileURLWithPath: (board[0] as! String)) {
                let suffix = url.pathExtension!
                for ext in self.fileTypes {
                    if ext.lowercaseString == suffix {
                        return true
                    }
                }
            }
        }
        return false
    }
   
}
