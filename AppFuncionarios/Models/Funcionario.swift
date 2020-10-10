//
//  Funcionario.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

let AVATAR_BASE_URL: String = "https://randomuser.me/api/portraits/"

struct Funcionario {
    let nome: String?
    let sobrenome: String?
    let email: String?
    let matricula: String?
    let avatar: String?
}
