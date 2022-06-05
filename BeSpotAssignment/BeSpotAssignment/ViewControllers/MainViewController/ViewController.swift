//
//  ViewController.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 4/6/22.
//

import UIKit

class ViewController: UIViewController,ReloadDataDelegate,UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.arrayGeoInfo.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let displayViewController:DisplayDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DisplayDetailsViewController") as! DisplayDetailsViewController
        displayViewController.details = self.viewModel.arrayGeoInfo[indexPath.row]
        displayViewController.modalPresentationStyle  = .fullScreen
        self.navigationController?.pushViewController(displayViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCellGeoInfo = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellGeoInfo
        loadDataCell(cell: cell, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
    func reloadData() {
        DispatchQueue.main.async {
            self.tableViewGeoInfo.reloadData()
        }
    }
    var viewModel = ViewModel()
    @IBOutlet var tableViewGeoInfo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        // Do any additional setup after loading the view.
        
    }


}

extension ViewController {
    func initialView(){
        self.navigationController?.navigationBar.topItem?.title = "BeSpot Assignment"
        self.tableViewGeoInfo.delegate = self
        self.tableViewGeoInfo.dataSource = self
        self.viewModel.fetchGeoInfo()
        self.viewModel.delegate = self        
    }
    func loadDataCell(cell:TableViewCellGeoInfo,indexPath:IndexPath){
        cell.lblUUID.text = viewModel.arrayGeoInfo[indexPath.row].uuid
        cell.lblCode.text = viewModel.arrayGeoInfo[indexPath.row].code
        cell.lblName.text = viewModel.arrayGeoInfo[indexPath.row].name
        cell.lblAddress.text = viewModel.arrayGeoInfo[indexPath.row].address
        cell.lblReward.text = String(describing:viewModel.arrayGeoInfo[indexPath.row].reward_checkin_points!)
        cell.lblLatitude.text = String(describing:viewModel.arrayGeoInfo[indexPath.row].location!.lat!)
        cell.lblLongitutde.text = String(describing:viewModel.arrayGeoInfo[indexPath.row].location!.lon!)
        for item in 0..<viewModel.arrayGeoInfo[indexPath.row].tags.count{
            cell.txtTags.text = cell.txtTags.text + "\n" + viewModel.arrayGeoInfo[indexPath.row].tags[item].lowercased()
        }
        cell.lblType.text = viewModel.arrayGeoInfo[indexPath.row].type
    }
}
