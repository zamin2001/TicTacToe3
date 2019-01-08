//
//  ViewController.swift
//  TicTacToe3
//
//  Created by zamin ahmed on 11/27/18.
//  Copyright © 2018 zamin ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var Gridlabel0: GridLabels!
    @IBOutlet weak var Gridlabel1: GridLabels!
    
    @IBOutlet weak var Gridlabel2: GridLabels!
    
    @IBOutlet weak var Gridlabel3: GridLabels!
    
    @IBOutlet weak var Gridlabel4: GridLabels!
    
    @IBOutlet weak var Gridlabel5: GridLabels!
    
    @IBOutlet weak var Gridlabel6: GridLabels!

    
    @IBOutlet weak var Gridlabels7: GridLabels!
    
    @IBOutlet weak var Gridlabels8: GridLabels!
    
    var labelsArray = [GridLabels]()
        var xTurn = true
        var gameOver = false
        var tiegame = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            labelsArray.append(Gridlabel0)
            labelsArray.append(Gridlabel1)
            labelsArray.append(Gridlabel2)
            labelsArray.append(Gridlabel3)
            labelsArray.append(Gridlabel4)
            labelsArray.append(Gridlabel5)
            labelsArray.append(Gridlabel6)
            labelsArray.append(Gridlabels7)
            labelsArray.append(Gridlabels8)
        }
    
        func displayWinningMessage(message:String) {
            let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title:"Reset", style:.default) { (action) in
                self.resetgame()
            }
            alert.addAction(alertAction)
            present(alert,animated:true,completion: nil)
            gameOver = true
        }
        
        func checkForWinner(){
            // check top row
            if (Gridlabel0.text != "") &&
                (Gridlabel0.text == Gridlabel1.text) && (Gridlabel1.text == Gridlabel2.text) {
                displayWinningMessage(message: Gridlabel0.text! + "Wins")
            }
                // check middle row
            else if (Gridlabel3.text != "") &&
                (Gridlabel3.text == Gridlabel4.text) && (Gridlabel4.text == Gridlabel5.text) {
                displayWinningMessage(message: Gridlabel3.text! +  "Wins")
            }
                // check bottom row
            else if (Gridlabel6.text != "") &&
                (Gridlabel6.text == Gridlabels7.text) && (Gridlabels7.text == Gridlabels8.text) {
                displayWinningMessage(message: Gridlabel6.text! + "Wins")
            }
                // check first column
            else if (Gridlabel0.text != "") &&
                (Gridlabel0.text == Gridlabel3.text) && (Gridlabel3.text == Gridlabel6.text) {
                displayWinningMessage(message: Gridlabel0.text! + "Wins")
            }
                //Second column check
            else if (Gridlabel1.text != "") &&
                (Gridlabel1.text == Gridlabel4.text) && (Gridlabel4.text == Gridlabels7.text) {
                displayWinningMessage(message: Gridlabel1.text! + "Wins")
            }
                //Diagonal check
            else if (Gridlabel0.text != "") &&
                (Gridlabel0.text == Gridlabel4.text) && (Gridlabel4.text == Gridlabels8.text) {
                displayWinningMessage(message: Gridlabel0.text! + "Wins")
            }
                // Other Diagonal check
            else if (Gridlabel2.text != "") &&
                (Gridlabel2.text == Gridlabel4.text) && (Gridlabel4.text == Gridlabel6.text) {
                displayWinningMessage(message: Gridlabel2.text! + "Wins")
            }
                // Last Column
            else if (Gridlabel2.text != "") &&
                (Gridlabel2.text == Gridlabel5.text) && (Gridlabel5.text == Gridlabels8.text){
                displayWinningMessage(message: Gridlabel2.text! + "Wins")
            }
            else {
                for labels in labelsArray {
                    tiegame = true
                    if labels.cantap == true {
                        tiegame = false
                        return
                    }
                }
                if tiegame {
                    displayWinningMessage(message: "Tie Game")
                }
            }
        }
        
        func resetgame(){
            for labels in labelsArray{
                labels.text = ""
                labels.cantap = true
            }
            xTurn = true
            gameOver = false
        }
    
        @IBAction func WhenTapped(_ sender: UITapGestureRecognizer) {
        
        if !gameOver {
                //print("Tapped somewhere")
                for label in labelsArray{
                    if
                label.frame.contains(sender.location(in:backgroundView)) {
                        //(label.text = "x")
                        if label.cantap {
                            if xTurn {
                                label.text = "X"
                            }
                            else {
                                label.text = "O"
                            }
                            xTurn = !xTurn
                         label.cantap = false
                            checkForWinner()
                        }
                    }
                }
            }
        }
    }




