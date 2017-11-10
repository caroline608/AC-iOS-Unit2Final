//
//  TableViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Keshawn Swanston on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var crayons = [Crayon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        
       
    }
    func loadData() {
        self.crayons = Crayon.allTheCrayons
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Crayon Cell", for: indexPath)
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(displayP3Red:CGFloat(crayon.red)/255, green:CGFloat(crayon.green)/255, blue:CGFloat(crayon.blue)/255, alpha: 1)
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedCrayon = self.crayons[selectedRow]
            destination.crayon = selectedCrayon
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
