#!/usr/bin/env swift
import Foundation
import Cocoa

class Workflow {
  init() { }

  func run() {
    guard 
      let inputStr = inputStr,
      !inputStr.isEmpty,
      let image = generateQRCode(from: inputStr) else {
      print("Error generating QR code")
      return
    }
    save(image: image, to: savePath)
  }

  func generateQRCode(from content: String) -> NSImage? {
    let data = content.data(using: .utf8)
	
    if let filter = CIFilter(name: "CIQRCodeGenerator") {
      filter.setValue(data, forKey: "inputMessage")
      let transform = CGAffineTransform(scaleX: 3, y: 3)
      
      if let output = filter.outputImage?.transformed(by: transform) {
        let rep = NSCIImageRep(ciImage: output)
        let nsImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        return nsImage
      }
    }
    return nil
  }

  func save(image: NSImage, to path: URL) {
    _ = image.pngWrite(to: path)
  }

  var inputStr: String? {
    CommandLine.arguments.dropFirst().first
  }

  var savePath: URL {
    URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("qrcode.png")
  }
}

extension NSImage {
	var pngData: Data? {
		guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
		return bitmapImage.representation(using: .png, properties: [:])
	}

	func pngWrite(to url: URL, options: Data.WritingOptions = .atomic) -> Bool {
		do {
			try pngData?.write(to: url, options: options)
			return true
		} catch {
			print(error)
			return false
		}
	}
}

Workflow().run()