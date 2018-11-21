//
//  ViewController.swift
//  MadLibs
//
//  Created by Sander de Vries on 19/11/2018.
//  Copyright © 2018 Sander de Vries. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var selectedStory = ""

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /// Segue into to wordsview with correct story
    @IBAction func storyButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "wordsSegue", sender: sender)
    }
    
    @IBAction func unwindToWelcomeScreen(segue: UIStoryboardSegue){
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wordsSegue" {
            let wordViewController = segue.destination as! WordsViewController
            let button = sender as! UIButton
            wordViewController.story = (button.titleLabel?.text)!
        }
    }
    
    
    
    
}

