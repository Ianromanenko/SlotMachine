//
//  ViewController.swift
//  SlotMachine
//
//  Created by Yan on 2018-02-06.
//  Copyright © 2018 Centennial College. All rights reserved.
//
// Name: Slot machine app
// Author: Yan Romanenko
// Student ID: 300965052
// 07.02.2018
// Description: its a slot machine app, created fot assignment 1 in Toronto, Centennial College

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slotView1: UIImageView!
    @IBOutlet weak var slotView2: UIImageView!
    @IBOutlet weak var slotView3: UIImageView!
    
    @IBOutlet weak var userMoneyLabel: UILabel!
    @IBOutlet weak var userBetLabel: UILabel!
    @IBOutlet weak var jeckPotLabel: UILabel!
    
    @IBOutlet weak var btnSpinOutlet: UIButton!
    
    var first: Int = 0
    var second: Int = 0
    var third: Int = 0
    var userMoney : Int = 1000
    var userBet: Int = 10
    var jackPot: Int = 10000

    
    
    // Main "SPIN" button functionallity
    @IBAction func btnSpin(_ sender: Any) {
        
        
        // check if user have enough money
        if userMoney == 0 || userMoney < 0 {
            btnSpinOutlet.isEnabled = false
            slotView1.image = UIImage(named: "gameOver.png")
            slotView2.image = UIImage(named: "gameOver.png")
            slotView2.image = UIImage(named: "gameOver.png")
        } else {
        
            
        // random generation
        first = Int(arc4random_uniform(5))
        second = Int(arc4random_uniform(5))
        third = Int(arc4random_uniform(5))
            
        
        //put images depend on generated numbers
        switch first {
        case 0: slotView1.image = UIImage(named: "slot1.png")
        case 1: slotView1.image = UIImage(named: "slot2.png")
        case 2: slotView1.image = UIImage(named: "slot3.png")
        case 3: slotView1.image = UIImage(named: "slot4.png")
        case 4: slotView1.image = UIImage(named: "slot6.png")
        default:
            break
        }
       
        switch second {
        case 0: slotView2.image = UIImage(named: "slot1.png")
        case 1: slotView2.image = UIImage(named: "slot2.png")
        case 2: slotView2.image = UIImage(named: "slot3.png")
        case 3: slotView2.image = UIImage(named: "slot4.png")
        case 4: slotView2.image = UIImage(named: "slot6.png")
        default:
            break
        }
        
        switch third {
        case 0: slotView3.image = UIImage(named: "slot1.png")
        case 1: slotView3.image = UIImage(named: "slot2.png")
        case 2: slotView3.image = UIImage(named: "slot3.png")
        case 3: slotView3.image = UIImage(named: "slot4.png")
        case 4: slotView3.image = UIImage(named: "slot6.png")
        default:
            break
        }
        
        print(first, second, third)
        

        calcWin()
        userMoneyLabel.text = "\(userMoney)"
        userBetLabel.text = "\(userBet)"
        
        jackPot = jackPot + userBet
        jeckPotLabel.text = "\(jackPot)"
        }
    }

    
    //button to reduse bet
    @IBAction func btnLow(_ sender: Any) {
        userBet = userBet - 10
        userBetLabel.text = "\(userBet)"
        if userBet < 10 {
            userBet = 10
            userBetLabel.text = "\(userBet)"

        }
        checkBetValue()
    }

    
    //button to increase bet
    @IBAction func btnUp(_ sender: Any) {
        userBet = userBet + 10
        userBetLabel.text = "\(userBet)"
        checkBetValue()
    }
    
    
    //chek if users' bet smaller that amount of his money
    func checkBetValue () {
        if userBet < userMoney {
            btnSpinOutlet.isEnabled = true
        } else if userBet > userMoney {
            btnSpinOutlet.isEnabled = false
        }
    }
    
    
    //calculating of prise
    func calcWin() {
        
        if first == 5 && second == 5 && third == 5 {
            userMoney = userMoney + jackPot
            jackPot = 0
            jeckPotLabel.text = "\(jackPot)"
            print("JACKPOT")
        }
        else if first == 0 && second == 0 && third == 0 {
            userMoney = userMoney + userBet * 8
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 1 && second == 1 && third == 1 {
            userMoney = userMoney + userBet * 9
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 2 && second == 2 && third == 2 {
            userMoney = userMoney + userBet * 10
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 3 && second == 3 && third == 3 {
            userMoney = userMoney + userBet * 11
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 4 && second == 4 && third == 4 {
            userMoney = userMoney + userBet * 12
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 0 && second == 0 || second == 0 && third == 0 || first == 0 && third == 0 {
            userMoney = userMoney + userBet * 2
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 1 && second == 1 || second == 1 && third == 1 || first == 1 && third == 1 {
            userMoney = userMoney + userBet * 3
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 2 && second == 2 || second == 2 && third == 2 || first == 2 && third == 2 {
            userMoney = userMoney + userBet * 4
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 3 && second == 3 || second == 3 && third == 3 || first == 3 && third == 3 {
            userMoney = userMoney + userBet * 5
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 4 && second == 4 || second == 4 && third == 4 || first == 4 && third == 4 {
            userMoney = userMoney + userBet * 6
            userMoneyLabel.text = "\(userMoney)"
        }
        else if first == 5 && second == 5 || second == 5 && third == 5 || first == 5 && third == 5 {
            userMoney = userMoney + userBet * 7
            userMoneyLabel.text = "\(userMoney)"
        } else {
            userMoney = userMoney - userBet
        }
    }
    
    
   //quit button
    @IBAction func quit(_ sender: Any) {
UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
    
    
    //reset button
    @IBAction func reset(_ sender: Any) {
        userMoney = 1000
        userBet = 10
        jackPot = 10000
        userMoneyLabel.text = "\(userMoney)"
        userBetLabel.text = "\(userBet)"
        jeckPotLabel.text = "\(jackPot)"
        slotView1.image = UIImage(named: "default.png")
        slotView2.image = UIImage(named: "default.png")
        slotView3.image = UIImage(named: "default.png")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slotView1.image = UIImage(named: "default.png")
        slotView2.image = UIImage(named: "default.png")
        slotView3.image = UIImage(named: "default.png")
        userMoneyLabel.text = "\(userMoney)"
        userBetLabel.text = "\(userBet)"
        jeckPotLabel.text = "\(jackPot)"
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpeg")!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

