//
//  LobbyViewController.swift
//  techmon
//
//  Created by 泉 千種 on 2020/05/15.
//  Copyright © 2020 Izumi zu-mi-. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {
    
    @IBOutlet var nameLabal: UILabel!
    @IBOutlet var staminaLabal: UILabel!

    let techMonManager = TechMonManager.shared
    
    var stamina: Int = 100
    var staminaTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabal.text = "勇者"
        staminaLabal.text = "\(stamina) / 100"
        staminaTimer = Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(updateStaminaValue),
            userInfo: nil,
            repeats: true)
        staminaTimer.fire()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        techMonManager.playBGM(fileName: "lobby")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        techMonManager.stopBGM()
    }
    
    @IBAction func toBattle() {
        if stamina >= 50{
            stamina -= 50
            staminaLabal.text = "\(stamina) / 100"
            performSegue(withIdentifier: "toBattle", sender: nil)
        }else{
            let alert = UIAlertController(
            title: "バトルに行けません",
            message: "スタミナをためてください",
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func updateStaminaValue(){
        if stamina < 100{
            stamina += 1
            staminaLabal.text = "\(stamina) / 100"
        }
    }


}
