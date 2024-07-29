//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Mark Santoro on 7/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cadLabel: UILabel!
    @IBOutlet var chfLabel: UILabel!
    @IBOutlet var gbpLabel: UILabel!
    @IBOutlet var jpyLabel: UILabel!
    @IBOutlet var usdLabel: UILabel!
    @IBOutlet var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getRatesClicked(_ sender: Any) {
        // 1. Create a request & open a session
        // 2. Get response and data
        // 3. Process the data (Parsing and JSON serialization)
        
        // Step 1
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=6d65c43a0197cba95ac4cc1200f0f6ab")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) {(data, response, error) in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }else {
          // step 2
                if data != nil{
                    do{
                        var jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                        // ASYNC
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                        
                        
                    } catch{
                        print("error")
                    }
                    
                }
             
            }
         
        }
        
        task.resume()
        
        
        
    }
}

