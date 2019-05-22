//
//  WinnerViewController.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    @IBOutlet weak var winnerImageView: UIImageView!
    
    var winner : MagicalCreature!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(winner.name)
        winnerImageView.image! = winner.image!
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
