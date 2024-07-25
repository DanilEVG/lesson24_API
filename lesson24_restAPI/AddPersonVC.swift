//
//  AddPersonVC.swift
//  lesson24_restAPI
//
//  Created by Даниил Евгеньевич on 24.07.2024.
//

import Foundation
import UIKit

class AddPersonVC: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addPersonTap(_ sender: UIButton) {
        if firstNameTextField.text == "" ||
            lastNameTextField.text == "" ||
            emailTextField.text == "" {
            print("Заполните все поля")
            return
        }
        Task {
            guard let firstName = firstNameTextField.text,
                  let lastName = lastNameTextField.text,
                  let email = emailTextField.text else {
                return
            }
            try await apiService.newPerson(firstName: firstName, lastName: lastName, email: email)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backTap(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
