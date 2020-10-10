//
//  MainViewController.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: # IBOutlets
    
    @IBOutlet weak var funcionariosTableView: UITableView!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    // MARK: # Class Properties

    var funcionarios: [Funcionario] = [
        Funcionario(nome: "Taylor", sobrenome: "Swift", email: "taylor@swift.com", matricula: "6302439817", avatar: "avatar1.png"),
        Funcionario(nome: "Holden", sobrenome: "Stribling", email: "hstribling1@ebay.com", matricula: "8815929614", avatar: "avatar2.png"),
        Funcionario(nome: "Wye", sobrenome: "Have", email: "whave2@geocities.com", matricula: "5782596120", avatar: "avatar3.png"),
        Funcionario(nome: "Elnore", sobrenome: "Scottesmoor", email: "escottesmoor3@merriam-webster.com", matricula: "9109688919", avatar: "avatar4.png"),
        Funcionario(nome: "Wiley", sobrenome: "Buswell", email: "wbuswell4@nba.com", matricula: "6821742332", avatar: "avatar5.png"),
        Funcionario(nome: "Marilin", sobrenome: "Berrane", email: "mberrane5@booking.com", matricula: "9448764448", avatar: "avatar6.png"),
        Funcionario(nome: "Orton", sobrenome: "Trippack", email: "otrippack6@jiathis.com", matricula: "2345038705", avatar: "avatar1.png"),
        Funcionario(nome: "Raimondo", sobrenome: "Rennox", email: "rrennox7@unesco.org", matricula: "3924705968", avatar: "avatar2.png"),
        Funcionario(nome: "Phaedra", sobrenome: "Vellacott", email: "pvellacott8@opera.com", matricula: "6771265676", avatar: "avatar3.png"),
        Funcionario(nome: "Isobel", sobrenome: "Lebbon", email: "ilebbon9@ucsd.edu", matricula: "7681585079", avatar: "avatar4.png"),
    ]
    
    // MARK: # Class Methods

    private func configTableView() {
        self.funcionariosTableView.dataSource = self
        self.funcionariosTableView.delegate = self
        
        // registrar a TableViewCell, qual xib utilizar para renderizar as linhas da TableView
        self.funcionariosTableView.register(UINib(nibName: "FuncionarioTableViewCell", bundle: nil), forCellReuseIdentifier: "FuncionarioTableViewCell")
    }
    
    
    // MARK: # LifeCycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }

}

// MARK: # Table View Data Source

extension MainViewController: UITableViewDataSource {
    
    // quantidade de linhas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.funcionarios.count
    }
    
    // monta a linha
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FuncionarioTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FuncionarioTableViewCell", for: indexPath) as? FuncionarioTableViewCell
        
        cell?.setup(funcionario: self.funcionarios[indexPath.row])

        return cell ?? UITableViewCell()
    }
}

// MARK: # Table View Delegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
