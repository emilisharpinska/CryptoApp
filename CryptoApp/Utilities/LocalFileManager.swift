//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 10/07/2026.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init(){}
    
    func saveImage(image: UIImage, imageName: String, folderName: String){
        //create folder
        createFolderIfNeeded(folderName: folderName)
        
        //get path for image
        guard
            let data = image.pngData(),
            let url = getURlForImage(imageName: imageName, folderName: folderName)
        else {return}
        
        //save image to path
        do{
            try data.write(to: url)
        } catch let error {
            print("Error saving image.ImageName: \(imageName). \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getURlForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path)
        else {return nil}
        return UIImage(contentsOfFile: url.path)
    }
    
    //here we create the folder for saving images.
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else {return}
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory.FolderName: \(folderName). \(error)")
            }
        }
    }
    
    //here folder not created, we only know where it has to be.
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    //here we create only path for images in folder
    private func getURlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {return nil}
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
