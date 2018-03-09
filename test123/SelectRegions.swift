//
//  SelectRegions.swift
//  test123
//
//  Created by Himanshi Bhardwaj on 3/2/18.
//  Copyright © 2018 Himanshi Bhardwaj. All rights reserved.
//

import UIKit

class SelectRegions: UITableViewController {
    
    @IBOutlet weak var shuffleCountriesSwitch: UISwitch!
    override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        shuffleCountriesSwitch.onTintColor = .themeColor
        shuffleCountriesSwitch.tintColor = .themeColor
    }
    
    @IBAction func shuffleCountriesSwitchValueChanged(_ sender: UISwitch) {
        DAO.shuffleOn = sender.isOn
    }
    private enum RegionSection: Int {
        case all
        case americas
        case asia
        case europe
        case oceania
        case others
        case shuffleCountries
        case searchCountry
    }
    
    //MARK:  UITableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = RegionSection(rawValue: indexPath.section) else {
            fatalError("A RegionSection should map to the index path's section")
        }
        
        switch section {
        case .asia: DAO.regionSelected = "Asia"
            performSegue(withIdentifier: "detailsSegue", sender: (Any).self)
            
        case .europe: DAO.regionSelected = "Europe"
            performSegue(withIdentifier: "detailsSegue", sender: (Any).self)
        case .americas: DAO.regionSelected = "Americas"
            performSegue(withIdentifier: "detailsSegue", sender: (Any).self)
        case .oceania: DAO.regionSelected = "Oceania"
            performSegue(withIdentifier: "detailsSegue", sender: (Any).self)
        case .others: DAO.regionSelected = "Others"
            performSegue(withIdentifier: "detailsSegue", sender: (Any).self)
        case .all: DAO.regionSelected = "All"
            performSegue(withIdentifier: "detailsSegue", sender: (Any).self)
        case .shuffleCountries: break
        case .searchCountry: searchCountry()
        }
        
    }
    
    func searchCountry() {
        performSegue(withIdentifier: "searchCountrySegue", sender: (Any).self)  
    }
}
