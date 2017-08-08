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
    
    
    let p2 = PartyRock(imageURL: "http://img2-ak.lst.fm/i/u/arO/790ab7c5f93d4c8bbaec8c82f11f3b05", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JHaDI9X_Cs0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Rise From the Ashes")
    

    let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/Lr34glbDe_Q/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Lr34glbDe_Q\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Jessica")
   
    let p4 = PartyRock(imageURL: "http://www.wechameleon.com/image.axd?picture=2012%2F2%2FQuietdrive+-+Until+the+End+(Acoustic)+-+video.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UjXAZ8B7y3A\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Until the End (Acoustic)")
    
    let p5 = PartyRock(imageURL: "http://fana.me/wp-content/uploads/2010/11/Quietdrive-Way-Out-Single-300x300.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vywu2TNEQdQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Way Out")
    
    partyRocks.append(p1)
    partyRocks.append(p2)
    partyRocks.append(p3)
    partyRocks.append(p4)
    partyRocks.append(p5)
    
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
      let partyRock = partyRocks[indexPath.row]
    
    performSegue(withIdentifier: "VideoVC", sender: partyRock)
   
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? VideoViewController {
      if let party = sender as? PartyRock {
        destination.partyRock = party
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return partyRocks.count
  }


}

