//
//  ViewController.swift
//  iKid
//
//  Created by Ian Wang on 5/2/22.
//

import UIKit

class KidViewController: UIViewController {
    
    var j: JokeViewController? = nil
    var k: AnswerViewController? = nil
    var tabs = ["good", "dad", "pun", "knockknock"]
    var currentTab = 0
    var currentKnock = 0
    
    var jokeArr = ["The final four letters in the word \n “queue” aren’t silent...", "Why didn’t 4 ask out 5?", "Need an ark to save two of every animal?", "test"]
    var ansArr = ["They’re just waiting their turn.", "He was 2^2", "I Noah guy", "test"]
    var knockKnock = ["Knock Knock.", "Who's there?", "Double", "Double who?", "W!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCards()
        switchViewController(nil, to: j)
    }

    func updateCards() {
        print(self.restorationIdentifier)
        if (tabs[currentTab] != self.restorationIdentifier!) {
        switch self.restorationIdentifier {
            case "good":
                currentTab = 0
            case "dad":
                currentTab = 1
            case "pun":
                currentTab = 2
            case "knockknock":
                currentTab = 3
            default:
                currentTab = 0
            }
        }
        
        jokeBuilder(currentTab)
        answerBuilder(currentTab)
    }
    
    @IBAction func nextSwitch(_ sender: Any) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)

        if j != nil &&
            j!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            k!.view.frame = self.view.frame
            switchViewController(j, to: k)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            j!.view.frame = self.view.frame
            switchViewController(k, to: j)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        updateCards();
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
            if currentTab == 3 && to == j {
                j!.updateData(knockKnock[currentKnock])
                currentKnock += 1;
                if (currentKnock == 5) {
                    currentKnock = 0;
                }
            } else if currentTab == 3 && to == k {
                k!.updateData(knockKnock[currentKnock])
                currentKnock += 1;
                if (currentKnock == 5) {
                    currentKnock = 0;
                }
            }
        }
    }
    
    fileprivate func jokeBuilder(_ index: Int) {
        if j == nil {
            j = storyboard?.instantiateViewController(identifier: "joke") as? JokeViewController
            j!.data = jokeArr[index]
        }
    }
    
    fileprivate func answerBuilder(_ index: Int) {
        if k == nil {
            k = storyboard?.instantiateViewController(identifier: "answer") as? AnswerViewController
            k!.data = ansArr[index]
        }
    }
    
  
    
    
    
}

