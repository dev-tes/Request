//
//  ConfigureLabels.swift
//  Request
//
//  Created by  Decagon on 31/10/2021.
//

import Foundation

class CarGetter {
    
    
    func getData(completionHandler: @escaping (Cars) -> ()) -> String {
        var imgLink = ""
        
        let url = "https://api.staging.myautochek.com/v1/inventory/make?popular=true"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, error, response in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(Cars.self, from: data)
                        completionHandler(json)
                        imgLink = json.makeList[0].imageURL
                        print(json.makeList[0].id)
                        print(json.makeList[1].name)
                        print(json.makeList[0].imageURL)
                        print(json.pagination.currentPage)
                        print(json.pagination.total)
                        print(json.pagination.pageSize)
                    }
                    catch {
                    }
                }
            }.resume()
        }
        return imgLink
    }
    
    func getImageData(completionHandler: @escaping (Data) -> ()) {
        
        let url = "https://storage.googleapis.com/img.autochek.africa/marketplace/bmw.png"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, error, response in
                    do {
                        let imgData = try Data(contentsOf: url, options: NSData.ReadingOptions())
                        completionHandler(imgData)
                    } catch {
                        print(error)
                    }
            }.resume()
        }
    }
}
