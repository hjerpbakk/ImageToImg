//
//  ImageToImgTests.swift
//  ImageToImgTests
//
//  Created by Runar Ovesen Hjerpbakk on 12/06/15.
//  Copyright (c) 2015 Runar Ovesen Hjerpbakk. All rights reserved.
//

import Cocoa
import XCTest
import ImageToImg

class ImageOptimizerTests: XCTestCase {
    func testExample() {
        let imageOptimizer = ImageOptimizer()
        
        let succeeded = imageOptimizer.optimizeImageInPlace("ImageToImgTests/star.png")
        
        XCTAssert(succeeded)
    }
}
