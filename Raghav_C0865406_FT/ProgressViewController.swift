//
//  ProgressViewController.swift
//  Raghav_C0865406_FT
//
//  Created by Raghav Dhawan on 08/11/22.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var resultArray : [GameResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension ProgressViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! ProgressCellTableViewCell
        //newCell.resultLabel.text = String(resultArray[indexPath.row].number)
        
        newCell.resultLabel.text = "\(resultArray[indexPath.row].number) is \(resultArray[indexPath.row].selectedResult)"
        
        newCell.resultImage.image = resultArray[indexPath.row].result ? UIImage(named: "Correct") : UIImage(named: "InCorrect")
        
        return newCell
    }
    
    
}
