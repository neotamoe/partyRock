//
//  ViewController.swift
//  PartyRock
//
//  Created by Neota Moe on 8/7/17.
//  Copyright © 2017 Neota Moe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var partyRocks = [PartyRock]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/VX7EGi3ozCg/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bk3M95qcepw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Time After Time")
    partyRocks.append(p1)
    
    let p2 = PartyRock(imageURL: "http://img2-ak.lst.fm/i/u/arO/790ab7c5f93d4c8bbaec8c82f11f3b05", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JHaDI9X_Cs0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Rise From the Ashes")
    
    partyRocks.append(p2)

    let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/Lr34glbDe_Q/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Lr34glbDe_Q\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Jessica")
    
    partyRocks.append(p3)
    
    tableView.delegate = self
    tableView.dataSource = self
  
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
      
      let partyRock = partyRocks[indexPath.row]
      
      cell.updateUI(partyRock: partyRock)
      
      return cell
      
    } else {
      
      return UITableViewCell()
      
    }
    
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
   
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return partyRocks.count
  }


}

