//
//  RacesVC.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class RacesVC : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var racesData = [RacesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if racesData.count == 0 {
            self.fetchData()
        }
    }
    
    func fetchData() {
        NetworkManager.shared.fetchRaces {[weak self] (data) in
            if let data = data {
                self?.parseData(data: data)
            }
        }
    }
    
    func parseData(data : Data) {
        let decoder = JSONDecoder()
        do {
            racesData = try decoder.decode([RacesModel].self, from: data)
            self.tableView.reloadData()
        }
        catch {
            print("Error parsing Json")
        }
    }
    
}

extension RacesVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return racesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raceCell", for: indexPath) as! RacesCell
        let raceModel = racesData[indexPath.row]
        cell.configure(withModel: raceModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let raceModel = racesData[indexPath.row]
        if let details = raceModel.hasDetails, details == true {
            
        }
    }
    
}
