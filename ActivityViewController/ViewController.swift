//
//  ViewController.swift
//  ActivityViewController
//
//  Created by Dmytro Bal on 14.09.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShared = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }

// MARK: Methods
    
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 260, height: 40)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    
    func createButton() {
        self.buttonShared.frame = CGRect(x: 110, y: 600, width: 180, height: 80)
        self.buttonShared.setTitle("Share", for: .normal)
        self.buttonShared.backgroundColor = .orange
        self.view.addSubview(self.buttonShared)
        self.buttonShared.addTarget(self, action: #selector(handleShare(parametrSender:)), for: .touchUpInside)
        }
    
    @objc func handleShare(parametrSender: Any) {
        
        let text = self.textField.text
        if text?.count == 0 {
            let massege = "Enter text first"
            let alertController = UIAlertController(title: nil, message: massege, preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
    }
    
}


