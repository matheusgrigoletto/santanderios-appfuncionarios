//
//  FuncionarioTableViewCell.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class FuncionarioTableViewCell: UITableViewCell {

    // MARK: > IBOutlets
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    // MARK: > Methods
    
    func setup(funcionario: Funcionario?) {
        guard let $funcionario = funcionario else { return }
        
        self.tituloLabel.text = self.getNome($funcionario)
        self.subtituloLabel.text = $funcionario.email
        self.fotoImageView.image = self.getImage(funcionario: $funcionario)
    }
    
    func getImage(funcionario: Funcionario) -> UIImage? {
        let image = UIImage(named: funcionario.avatar ?? "") ?? nil
        return image
    }
    
    // Retorna o nome completo
    private func getNome(_ funcionario: Funcionario) -> String {
        let nome = (funcionario.nome ?? "") + " " + (funcionario.sobrenome ?? "")
        return nome.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
