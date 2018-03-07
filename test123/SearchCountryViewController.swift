//
//  SearchCountryViewController.swift
//  test123
//
//  Created by Himanshi Bhardwaj on 3/6/18.
//  Copyright © 2018 Himanshi Bhardwaj. All rights reserved.
//

import UIKit

class SearchCountryViewController: UIViewController {
    var countryList: [[String]] = []
    @IBOutlet weak var searchCountryTextField: SearchTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for key in DAO.countries.keys {
            countryList += DAO.countries[key]!
        }
        var countries: [SearchTextFieldItem] = []
        
        for each in countryList {
            countries.append(SearchTextFieldItem(title: each[0], subtitle: each[1], image: UIImage(named: each[2])))
        }
        
            searchCountryTextField.filterItems(countries)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
