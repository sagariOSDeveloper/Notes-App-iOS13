//
//  NotesViewController.swift
//  Notes App
//
//  Created by Sagar Baloch on 11/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    var cell:CellData?
    let saveButton = UIButton()
    let textField = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        textField.delegate = self
        setupView()
    }
    func setupView(){
        let backButton = UIButton()
        backButton.setTitle("< Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        saveButton.setTitle("Save Notes", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10).isActive = true
        textField.backgroundColor = .black
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 20)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
        textField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textField.text = cell!.notesDetail!
    }
    @objc func backButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func saveButtonPressed(){
        cell?.notesDetail = textField.text
        ViewController.shared.saveData()
        saveButton.isUserInteractionEnabled = false
        textField.endEditing(true)
        self.showToast(message: "Notes Saved Successfully", font: .systemFont(ofSize: 12.0))
    }
    
}
extension NotesViewController:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        saveButton.isUserInteractionEnabled = true
    }
    
}
extension NotesViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.white.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.black
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
