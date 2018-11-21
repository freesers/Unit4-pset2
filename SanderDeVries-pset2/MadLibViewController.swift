//
//  MadLibViewController.swift
//  MadLibs
//
//  Created by Sander de Vries on 19/11/2018.
//  Copyright © 2018 Sander de Vries. All rights reserved.
//

import UIKit

class MadLibViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    
    var storyText = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storyText
    }
}
