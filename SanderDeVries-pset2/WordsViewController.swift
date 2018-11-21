//
//  WordsViewController.swift
//  MadLibs
//
//  Created by Sander de Vries on 19/11/2018.
//  Copyright © 2018 Sander de Vries. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {
    
    var story = ""
    var currentStory: Story!
    var wordsEntered: [String] = []
    
    @IBOutlet weak var wordsLeftLabel: UILabel!
    @IBOutlet weak var wordsTextfield: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get text from file
        guard let storyPath = Bundle.main.path(forResource: storyFile(for: story), ofType: "txt") else { return }
        let text = try! String(contentsOfFile: storyPath, encoding: .utf8)
        
        currentStory = Story(withText: text)
        updateView()
        
        // add recognition for enter pressed
        wordsTextfield.addTarget(self, action: #selector(enterPressed), for: .editingDidEndOnExit)
    }
    
    @objc func enterPressed() {
        if let word = wordsTextfield.text {
            currentStory.fillInPlaceholder(word: word)
            wordsTextfield.text = ""
        }
        updateView()
    }
    
    /// update label
    func updateView() {
        
        // update label with remaining words
        let wordsleft = currentStory.remainingPlaceholders
        wordsLeftLabel.text = "\(wordsleft) word(s) left"
        
        // update placeholder text for the type of word to be filled in
        wordsTextfield.placeholder = currentStory.nextPlaceholder
        
        // check for all words
        if currentStory.isFilledIn {
            performSegue(withIdentifier: "storySegue", sender: self)
        }
    }
    
    
    /// Choose corerct story file for the button pressed
    func storyFile(for story: String) -> String {
        switch story {
        case "Simple":
            return "madlib0_simple"
        case "Tarzan":
            return "madlib1_tarzan"
        case "University":
            return "madlib2_university"
        case "Clothes":
            return "madlib3_clothes"
        case "Dance":
            return "madlib4_dance"
        default:
            return "madlib0_simple"
        }
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "storySegue" {
            let madLibViewController = segue.destination as! MadLibViewController
            
            // pass filled in story to storytext in madLibViewController
            let storyText = currentStory.normalText
            madLibViewController.storyText = storyText
        }
    }

}
