//
//  TableViewController.swift
//  TableViewController
//
//  Created by Alexander Bonney on 7/26/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var countries: [String:String] = [:]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        countries = Bundle.main.decode("flags.json")
        
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlagCell
        
        let keys = [String](countries.keys).sorted()
        
        
        cell.flagImage.image = UIImage(named: countries[keys[indexPath.row]]!)
//        cell.flagImage.layer.borderWidth = 1
//        cell.flagImage.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.flagImage.layer.shadowColor = UIColor.darkGray.cgColor
        cell.flagImage.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.flagImage.layer.shadowOpacity = 1
        cell.flagImage.layer.shadowRadius = 3.0
        cell.flagImage.clipsToBounds = false
        
//        cell.title.text = countries[indexPath.row]
        cell.title.text = keys[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let keys = [String](countries.keys).sorted()
            vc.selectedTitle = keys[indexPath.row]
            vc.selectedImage = countries[keys[indexPath.row]]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
