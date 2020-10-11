//
//  CadastroViewController.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 11/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

// MARK: # Protocols

protocol CadastroProtocol: class {
    func onSuccesRegister(funcionario: Funcionario)
}

class CadastroViewController: UIViewController {

    // MARK: # IBOutlets
    
    // MARK: # IBOutlets > Buttons
    @IBOutlet weak var cancelarButton: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    // MARK: # IBOutlets > TextFields
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobenomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var matriculaTextField: UITextField!
    
    // MARK: # IBOutlets > Labels
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var sobrenomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var matriculaLabel: UILabel!
    
    // MARK: # Class properties
    
    weak var delegate: CadastroProtocol?
    
    // MARK: # Class methods
    
    private func configDelegate() {
        self.nomeTextField.delegate = self
        self.sobenomeTextField.delegate = self
        self.emailTextField.delegate = self
        self.matriculaTextField.delegate = self
    }
    
    private func configUI() {
        self.cadastrarButton.layer.cornerRadius = 4.0
    }
    
    private func validate() {
        var fieldsValidated: Bool = true
        fieldsValidated = fieldsValidated && self.validateField(self.nomeTextField)
        fieldsValidated = fieldsValidated && self.validateField(self.sobenomeTextField)
        fieldsValidated = fieldsValidated && self.validateField(self.emailTextField)
        fieldsValidated = fieldsValidated && self.validateField(self.matriculaTextField)
        
        if fieldsValidated {
            let funcionario: Funcionario = Funcionario(nome: self.nomeTextField.text, sobrenome: self.sobenomeTextField.text, email: self.emailTextField.text, matricula: self.matriculaTextField.text, avatar: generateAvatar())
            // Dispara o delegate
            self.delegate?.onSuccesRegister(funcionario: funcionario)
            // Voltar pra Main
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func validateField(_ textField: UITextField) -> Bool {
        var label: UILabel?
        
        switch textField {
        case self.nomeTextField:
            label = self.nomeLabel
        case self.sobenomeTextField:
            label = self.sobrenomeLabel
        case self.emailTextField:
            label = self.emailLabel
        case self.matriculaTextField:
            label = self.matriculaLabel
        default:
            return true
        }
        
        if let $value = textField.text {
            label?.alpha = 0.0
            if $value.isEmpty {
                label?.alpha = 1.0
                return false
            }
        }

        return true
    }
    
    // MARK: # LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configDelegate()
        self.configUI()
    }
    
    // MARK: # IBActions
    
    @IBAction func tappedCancelarButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        self.validate()
    }

}

// MARK: # Delegates

extension CadastroViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.nomeTextField:
            self.sobenomeTextField.becomeFirstResponder()
        case self.sobenomeTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.matriculaTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }

        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let _ = self.validateField(textField)
    }
}
