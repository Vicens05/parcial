//
//  InicioViewController.swift
//  parcial
//
//  Created by user194452 on 5/28/22.
//

import UIKit

class InicioViewController: UIViewController{
    
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBAction func clickbtnSeeMore(_ sender: UIButton) {
        
        if sender.tag == 0 {
            self.lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            sender.tag = 1
            sender.setTitle("Ver menos", for: .normal)
            
        }else{
            self.lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ips..."
            sender.tag = 0
            sender.setTitle("Ver más", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
