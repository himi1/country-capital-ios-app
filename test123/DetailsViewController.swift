//
//  DetailsViewController.swift
//  test123
//
//  Created by Himanshi Bhardwaj on 3/5/18.
//  Copyright © 2018 Himanshi Bhardwaj. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var index = 0
    var region = DAO.regionSelected
    var regionList: [[String]] = []
    var countryList: [String] = []
    
    @IBOutlet weak var flagAndCountryView: UIView!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //flagAndCountryView.frame.height = self.view.frame.height
        getRegionList()
        capitalLabel.isHidden = true
        if DAO.shuffleOn {
            regionList = regionList.shuffled()
        }
        
        flagImage.layer.borderColor = UIColor.themeColor.cgColor
        flagImage.layer.borderWidth = 1
        
        
        self.navigationItem.title = region
        //var regionList = DAO.countries[region]
        countryList = regionList[index]
        updateUI()
    }
    
    func getRegionList() {
        if DAO.regionSelected == "All" {
            for key in DAO.countries.keys {
                regionList += DAO.countries[key]!
            }
            regionList.sort(by: {$0[0] < $1[0]})
            
        } else {
            regionList = DAO.countries[DAO.regionSelected]!
            
        }
    }
    
    @IBAction func showCapitalButtonTapped(_ sender: UIButton) {
        capitalLabel.isHidden = false
    }
    
    @IBAction func nextCountryButtonTapped(_ sender: UIButton) {
        index += 1
        
        if let list = regionList[safe: index] {
            countryList = list
            updateUI()
        }
        else {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func updateUI() {
        capitalLabel.isHidden = true
        countryLabel.text = countryList[0]
        capitalLabel.text = countryList[1] == "" ? "N/A": countryList[1]
        flagImage.image = UIImage(named: countryList[2])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

