//
//  MainViewController.swift
//  AppFuncionarios
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

enum AppSegue: String {
    case Cadastro = "CadastroViewController"
    case Detalhe = "DetalheViewController"
}

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
    
    var selectedFuncionario: Funcionario?
    
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
    
    // MARK: # Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AppSegue.Cadastro.rawValue {
            let viewController: CadastroViewController? = segue.destination as? CadastroViewController
            viewController?.delegate = self
        } else if segue.identifier == AppSegue.Detalhe.rawValue {
            let viewController: DetalheViewController? = segue.destination as? DetalheViewController
            viewController?.funcionario = self.selectedFuncionario
        }
    }
    
    // MARK: # IBActions
    
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: AppSegue.Cadastro.rawValue, sender: nil)
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
        self.selectedFuncionario = self.funcionarios[indexPath.row]

        self.performSegue(withIdentifier: AppSegue.Detalhe.rawValue, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.funcionarios.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

// MARK: # CadastroProtocol

extension MainViewController: CadastroProtocol {
    func onSuccesRegister(funcionario: Funcionario) {
        self.funcionarios.insert(funcionario, at: 0)
        
        self.funcionariosTableView.reloadData()
    }
}
