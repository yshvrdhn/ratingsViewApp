//
//  GamePickerViewController.swift
//  ratings
//
//  Created by Yashovardhan Chaturvedi on 22/01/16.
//  Copyright © 2016 YC. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {

    // property
    var selectedGame : String?{
        didSet{
            if let game = selectedGame {
                selectedGameIndex = games.indexOf(game)!
            }
        }
    }
    
    // variables
    
    var selectedGameIndex : Int?
    
    // hard coding values of games
    var games:[String] = [
        "Angry Birds",
        "Chess",
        "Russian Roullete",
        "Spin the Roullete",
        "Texas Hold'em Poker",
        " Tic-Tac-Toe"]
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath)
        // Configure the cell...
        
        cell.textLabel?.text = games[indexPath.row]
        if indexPath.row == selectedGameIndex{
            cell.accessoryType = .Checkmark
        }else{
         cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //other row is selected need to deselect it
        if let index = selectedGameIndex{
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedGame = games[indexPath.row]
        
        //update the checkmark for the currentrow
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "SaveSelectedGame" {
            if let cell = sender as? UITableViewCell{
                let indexPath = tableView.indexPathForCell(cell)
                if let index = indexPath?.row{
                    selectedGame = games[index]
                }
            }
        }
        // Pass the selected object to the new view controller.
    }
    

}
