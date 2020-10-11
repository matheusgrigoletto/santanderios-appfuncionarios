//
//  FuncionarioTableViewCell.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class FuncionarioTableViewCell: UITableViewCell {

    // MARK: # IBOutlets
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    // MARK: # Class Methods
    
    func setup(funcionario: Funcionario?) {
        guard let $funcionario = funcionario else { return }
        
        self.tituloLabel.text = getNome($funcionario)
        self.subtituloLabel.text = $funcionario.email
        self.fotoImageView.image = getImage(funcionario: $funcionario)
        self.fotoImageView.layer.cornerRadius = self.fotoImageView.frame.size.width / 2
    }
    
    // MARK: # LifeCycles
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
