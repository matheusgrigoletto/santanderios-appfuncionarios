//
//  Helpers.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 11/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation
import UIKit

// Retorna o nome completo
func getNome(_ funcionario: Funcionario) -> String {
    let nome = (funcionario.nome ?? "") + " " + (funcionario.sobrenome ?? "")
    return nome.trimmingCharacters(in: .whitespacesAndNewlines)
}

// Retorna o avatar
func getImage(funcionario: Funcionario) -> UIImage? {
    let image = UIImage(named: funcionario.avatar ?? "") ?? nil
    return image
}

// Retorna um avatar aleatório
func generateAvatar() -> String {
    let index = Int.random(in: 1...6)
    return "avatar\(index).png"
}
