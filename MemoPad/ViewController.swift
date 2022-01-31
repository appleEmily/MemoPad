//
//  ViewController.swift
//  MemoPad
//
//  Created by Emily Nozaki on 2022/01/31.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        
    }
    @IBAction func saveMemo() {
        
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                    print("OKボタンが押されました")
                }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    //自動でキーボード下げる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

