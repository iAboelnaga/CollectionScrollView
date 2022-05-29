//
//  ViewController.swift
//  CollectionScrollView
//
//  Created by Aboelnaga on 30/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushHowitWorks(_ sender: Any) {
        navigationController?.pushViewController(HowItWorkVC(), animated: true)
    }
    
}

