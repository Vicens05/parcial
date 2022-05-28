//
//  InicioViewController.swift
//  parcial
//
//  Created by user194452 on 5/28/22.
//

import UIKit

class InicioViewController: UIViewController{
    
    @IBOutlet private weak var anchorCenterContentY: NSLayoutConstraint!
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
                self.view.endEditing(true)
            }
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
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                self.registerKeyboardNotification()
            }
            
            override func viewWillDisappear(_ animated: Bool) {
                super.viewWillDisappear(animated)
                self.unregisterKeyboardNotification()
            }
            
            private func registerKeyboardNotification(){
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(self.keyboardWillShow(_:)),
                                                       name: UIResponder.keyboardWillShowNotification,
                                                       object: nil)
                
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(self.keyboardWillHide(_:)),
                                                       name: UIResponder.keyboardWillHideNotification,
                                                       object: nil)
                
            }
            
            private func unregisterKeyboardNotification(){
                NotificationCenter.default.removeObserver(self)
            }
            
            @objc private func keyboardWillHide(_ notification: Notification){
                let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
                
                UIView.animate(withDuration: animationDuration) {
                    self.anchorCenterContentY.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
            
            @objc private func keyboardWillShow(_ notification: Notification){
                let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
                        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
                    
                        UIView.animate(withDuration: animationDuration) {
                            self.anchorCenterContentY.constant = keyboardFrame.height
                            self.view.layoutIfNeeded()
                        }
            }
}
