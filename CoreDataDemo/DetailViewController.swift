//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 01/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        navigationItem.title = "College List"
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return 4
        return SharedData.arrayOfColleges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as?  DetailTableViewCell
            else
        {
           fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
       // cell.textLabel?.text = "hello"
        cell.textLabel?.text = SharedData.arrayOfColleges[indexPath.row].collegeName
        cell.detailTextLabel?.text = String(SharedData.arrayOfColleges[indexPath.row].collegeId)
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
