//
//  ViewController.swift
//  QR Code
//
//  Created by Kerem Demir on 22.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var button = UIButton()
    var textField = UITextField()
    var imageView = UIImageView()
    var qrcodeImage: CIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    func configure(){
        imageViewDesign()
        textFieldDesign()
        buttonDesign()
    }
    
    //MARK: - ImageView
    func imageViewDesign(){
        imageView.frame.size.width = 300
        imageView.frame.size.height = 300
        imageView.center = self.view.center
        view.addSubview(imageView)
    }
    
    //MARK: - TextField
    func textFieldDesign(){
        textField = UITextField(frame: CGRect(x: 10, y: 70.0, width: UIScreen.main.bounds.size.width - 20, height: 50.0))
        textField.placeholder = "Link"
        textField.textColor = .black
        textField.keyboardType = .default
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.keyboardType = .URL
        view.addSubview(textField)
    }
    
    //MARK: - UIButton
    func buttonDesign(){
        button = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width - 250, y: 130, width: 100, height: 40))
        button.frame.size.width = 100
        button.frame.size.height = 40
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector (buttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    //MARK: - Button
    @objc func buttonClicked(_ : UIButton){
        if let myTextField = textField.text {
            let data = myTextField.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            
            let img = UIImage(ciImage: (filter?.outputImage)!)
            imageView.image = img
        }
    }
}

