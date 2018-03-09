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
        //self.view.backgroundColor = .black
        if DAO.searchCountryList.isEmpty {
            self.searchCountryTextField.filterItems([SearchTextFieldItem(title: "Loading...", subtitle: "Looking for countries", image: ZGIFImage.image(name: "loading-spinner.gif"))])
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            DAO.createSearchCountryList()
            DispatchQueue.main.async {
                print("This is run on the main queue, after the previous code in outer block")
                self.searchCountryTextField.filterItems(DAO.searchCountryList)
            }
        }
        }
            else {
           //print(DAO.searchCountryList)
            self.searchCountryTextField.filterItems(DAO.searchCountryList)
        }

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
