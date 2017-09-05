//
//  StudentTableView.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 04/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import UIKit

class StudentTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var studentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Student List"
        studentTable.delegate = self
        studentTable.dataSource = self
        // Do any additional setup after loading the view.
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
       return SharedData.arrayOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = studentTable.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as?  StudentTableViewCell
            else
        {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
         //cell.textLabel?.text = "hello"
        cell.textLabel?.text = SharedData.arrayOfStudents[indexPath.row].studentName
        cell.detailTextLabel?.text = SharedData.arrayOfStudents[indexPath.row].studentCollege?.collegeName
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
