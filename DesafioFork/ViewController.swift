//
//  ViewController.swift
//  DesafioFork
//
//  Created by Calebe Nunes Pastor on 19/02/18.
//  Copyright © 2018 Calebe Nunes Pastor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMensagem: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.labelMensagem.text = self.retornaSaudacao()
    }
    
    // MARK: - Methods
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func retornaMensagem() -> String {
        // Pegar data atual
        let dataAtual = Date()
        
        // Criar datas para comparar horários
        guard let tarde = Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: dataAtual) else {
            return ""
        }
        guard let noite = Calendar.current.date(bySettingHour: 18, minute: 00, second: 00, of: dataAtual) else {
            return ""
        }
        
        // Comparar as datas e gerar as mensagens
        if dataAtual >= tarde && dataAtual < noite {
            return "Boa tarde"
        } else if dataAtual >= noite {
            return "Boa noite"
        } else {
            return "Bom dia"
        }
    }
    @IBAction func btnMensagem(_ sender: UIButton) {
        let alerta = UIAlertController(title: "", message: "\(retornaMensagem())", preferredStyle: .alert)
        let acao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(acao)
        self.present(alerta, animated: true, completion: nil)
    }
}

