//
//  ViewController.swift
//  VirginMoneyTask
//
//  Created by Karthik on 22/04/21.
//  Copyright © 2021 Karthik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var list = [Directory]()
    var roomsList = [Rooms]()
    var isSelected: Bool = false
    let spinner = UIActivityIndicatorView(style: .gray)
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        spinner.startAnimating()
        self.listTableView.backgroundView = spinner
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        self.listTableView.register(UINib(nibName: CustomNibs.employeeListNib, bundle: nil), forCellReuseIdentifier: CustomNibs.directoryCell )
        self.listTableView.register(UINib(nibName: CustomNibs.roomsListNib, bundle: nil), forCellReuseIdentifier: CustomNibs.roomCell)
        segmentControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        self.getEmployeeDetails()
       
    }

    // MARK: - Segment Control
    @IBAction func segmentedBtn(_ sender: Any) {
        let segment = sender as! UISegmentedControl
        switch segment.selectedSegmentIndex {
        case 0:
            self.getEmployeeDetails()
        case 1:
            self.getRoomDetails()
        default:
        break;
        }
    }
    
    
    // MARK: - Api call to get Employeedetails
    func getEmployeeDetails()
    {
        isSelected = true
         spinner.startAnimating()
        let url = URL(string: EndPoint.peopleUrl)
        guard url != nil else{
            debugPrint("url is nil")
            return
        }

        let dataSession =  URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil{
            let decoder = JSONDecoder()

          do {
            self.list = try decoder.decode([Directory].self, from: data!)
            DispatchQueue.main.async {
                self.listTableView.reloadData()
                self.spinner.stopAnimating()
                
            }
            } catch {
        print(error)
                }
            }
           }
        dataSession.resume()
        }
    
    
    // MARK: - Api call to get roomdetails
    func getRoomDetails(){
        isSelected = false
        self.spinner.startAnimating()
        let url = URL(string: EndPoint.roomUrl)
               guard url != nil else{
                   debugPrint("url is nil")
                   return
               }
        
        let dataSession =  URLSession.shared.dataTask(with: url!) { data, response, error in
                   if error == nil && data != nil{
                   let decoder = JSONDecoder()

                 do {
                   self.roomsList = try decoder.decode([Rooms].self, from: data!)
                   DispatchQueue.main.async {
                       self.listTableView.reloadData()
                       self.spinner.stopAnimating()
                       
                   }
                   } catch {
               print(error)
                       }
                   }
                  }
               dataSession.resume()
    }
    
func setImage(imageView:UIImageView,url:URL) {
    let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
        if error != nil{
            return
        }
        DispatchQueue.main.async {
            let img = UIImage(data: data!)
            imageView.image = img
        }
    }
    task.resume()
}

}

// MARK: - TableView Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSelected{
        return self.list.count
        }else
        {
        return self.roomsList.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSelected{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomNibs.directoryCell, for: indexPath) as! peopelListTableviewcell
        cell.nameLbl.text = self.list[indexPath.row].firstName
        cell.phoneNumberLbl.text = self.list[indexPath.row].phone
        self.setImage(imageView:cell.peopleImg!, url: URL(string: self.list[indexPath.row].avatar!)!)
        return cell
        } else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomNibs.roomCell, for: indexPath) as! RoomsListTableViewCell
            cell.idLbl.text = self.roomsList[indexPath.row].id
            cell.nameLbl.text = self.roomsList[indexPath.row].name
            
            cell.occupancyLbl.text = "\(String(describing: self.roomsList[indexPath.row].maxOccupancy!))"
            let roomOccupied = self.roomsList[indexPath.row].isOccupied
            if roomOccupied == true{
                cell.occupiedLbl.text = "Occupied"
            }else{
                
                 cell.occupiedLbl.text = "Not Occupied"
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if isSelected{
        return 100
        }
        return 120
    }
}


