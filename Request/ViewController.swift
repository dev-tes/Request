//
//  ViewController.swift
//  Request
//
//  Created by  Decagon on 31/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCar: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    let carGetter = CarGetter()
    
    let index = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureImageView()
    }
    
    func configureLabel() {
        self.carGetter.getData { json in
            DispatchQueue.main.async {
                self.firstCar.text = json.makeList[self.index].name
            }
        }
    }
    
    func configureImageView() {
        self.carGetter.getImageData { imgData in
            DispatchQueue.main.async {
                self.firstImage?.image = UIImage(data: imgData)
            }
        }
    }
}
// we need a struct and a url
