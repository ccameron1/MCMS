//
//  BattleViewController.swift
//  MCMS
//
//  Created by Carly Cameron on 5/21/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var fighterLabel: UILabel!
    @IBOutlet weak var fighter2ImageView: UIImageView!
    @IBOutlet weak var fighter1ImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var creature : MagicalCreature!
    var creature2 : MagicalCreature!
    var winner = MagicalCreature(name: "Winner", detail: "champion", image: UIImage(named: "paper")!, accessory: "gold medal")
    var creatures : [MagicalCreature] = []
    var fight1 = true
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
        fight1 = true
        for creature in creatures {
            print(creature.name!)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID2") as! UITableViewCell
        let creature = creatures[indexPath.row]
        cell.textLabel?.text = creature.name
        cell.detailTextLabel?.text = "\(creature.detail!)\n\(creature.accessory!)"
        cell.imageView?.image = creature.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = indexPath.row
         let creature = creatures[indexPath.row]
        print(creature.name!)
        winner = creature
//        cell?.imageView?.image = creature.image
        
        if fight1 {
            fighter1ImageView.image = creature.image
            fighterLabel.text = "Choose Fighter #2"
            fighterLabel.adjustsFontSizeToFitWidth = true
            fight1 = false
        } else {
            creature2 = creature
            fighter2ImageView.image = creature.image
            fighterLabel.text = "Choose Fighter #1"
            fighterLabel.adjustsFontSizeToFitWidth = true
            fight1 = true
        }
    }
    
    func determineWinner() {
        let prob = Int.random(in: 0...1)
        print(prob)
        //print(creature!)
        if prob == 0 {
            winner = creature!
        } else {
            winner = creature2!
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wvc = segue.destination as! WinnerViewController
        determineWinner()
        wvc.winner = winner
    }


}
