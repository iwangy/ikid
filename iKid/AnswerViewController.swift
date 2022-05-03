//
//  answerViewController.swift
//  iKid
//
//  Created by Ian Wang on 5/2/22.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    var _data: String? = nil
    open var data : String? {
      get {
          return self._data
      }
      set(value) {
          self._data = value
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        // Do any additional setup after loading the view.
    }
    
    func updateLabel() {
        answerLabel.text = data
    }
    
    func updateData(_ new: String) {
        data = new
        updateLabel()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
