//
//  DisplayDetailsViewController.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 5/6/22.
//

import UIKit

class DisplayDetailsViewController: UIViewController {
    @IBOutlet var locationView: UIView!
    var details:Model!
    @IBOutlet var lblType: UILabel!
    @IBOutlet var txtTags: UITextView!
    @IBOutlet var lblLatitude: UILabel!
    @IBOutlet var lblCode: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblUUID: UILabel!
    @IBOutlet var lblLongitude: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var tblViewDetails: UITableView!
    @IBOutlet var lblReward: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(details: details)
        // Do any additional setup after loading the view.
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
extension DisplayDetailsViewController{
    func loadData(details:Model){
        lblUUID.text = details.uuid
        lblCode.text = details.code
        lblName.text = details.name
        lblAddress.text = details.address
        lblReward.text = String(describing:details.reward_checkin_points!)
        lblLatitude.text = String(describing:details.location!.lat!)
        lblLongitude.text = String(describing:details.location!.lon!)
        for item in 0..<details.tags.count{
            txtTags.text = txtTags.text + "\n" + details.tags[item].lowercased()
        }
        lblType.text = details.type
        locationView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clickLocation(sender:)))
        gesture.numberOfTapsRequired  = 1
        locationView.addGestureRecognizer(gesture)
    }
    @objc func clickLocation(sender:UITapGestureRecognizer){
        let url = "http://maps.apple.com/maps?daddr=\(details.location!.lat!),\(details.location!.lon!)"
        UIApplication.shared.open(URL(string: url)!)

    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600.0
    }
}
