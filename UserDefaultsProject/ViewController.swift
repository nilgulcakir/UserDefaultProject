//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by Nilgul Cakir on 13.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var notTextField: UITextField!
    @IBOutlet weak var zamanTextField: UITextField!
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var zamanLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Açılışta kaydedilen notları görüntülemek için viewdidload'ta yazarız.
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        //nilsafety nil gelme olasılı ve uygulama çökmesine karşı
        if let gelenNot = kaydedilenNot as? String {
            notLabel.text = "Yapılacak İşler: \(gelenNot)"
        }
        if let gelenZaman = kaydedilenZaman as? String {
            zamanLabel.text = "Yapılacak Zaman: \(gelenZaman)"
        }
    }

    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        UserDefaults.standard.set(notTextField.text!, forKey: "not")
        UserDefaults.standard.set(zamanTextField.text!, forKey: "zaman")
        
        notLabel.text = "Yapılacak İşler: \(notTextField.text!)"
        zamanLabel.text = "Yapılacak Zaman: \(zamanTextField.text!)"
    }
    
    @IBAction func silTiklandi(_ sender: Any) {
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        if (kaydedilenNot as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "not")
            notLabel.text = "Yapılacak İşler: "
        }
        if (kaydedilenZaman as? String) != nil
        {
            UserDefaults.standard.removeObject(forKey: "zaman")
            zamanLabel.text = "Yapılacak Zaman: "
        }
        
    }
    
    
}

