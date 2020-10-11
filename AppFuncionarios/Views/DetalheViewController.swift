//
//  DetalheViewController.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 11/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {
    
    // MARK: # IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var matriculaLabel: UILabel!
    
    // MARK: # Class properties
    
    var funcionario: Funcionario?
    
    // MARK: # Class methods
    
    private func loadFuncionario() {
        guard let $funcionario = self.funcionario else { return }
        
        self.nomeLabel.text = getNome($funcionario)
        self.emailLabel.text = $funcionario.email
        self.matriculaLabel.text = $funcionario.matricula
        self.avatarImageView.image = getImage(funcionario: $funcionario)
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2
    }
    
    // MARK: # LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadFuncionario()
    }
    
}
