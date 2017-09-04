//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 01/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var collegeIdText: UITextField!
    @IBOutlet weak var collegeNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendCollegeButton(_ sender: Any) {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        context.perform {
            let collegeEntity: College = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
            collegeEntity.collegeName = self.collegeNameText.text
            guard self.collegeIdText.text?.isEmpty == false else {
                return
            }
            if  let collegeIdNumber = Int32(self.collegeIdText.text!){
                collegeEntity.collegeId = collegeIdNumber
            }
          //  var count : Int = 0
//            for item in SharedData.arrayOfColleges{
//                if item.collegeName == collegeEntity.collegeName{
//                    count += 1
//                }
//            }
          //  if count >= 1 {
            do{
                try context.save()
            }
            catch let error{
                print(error)
            }
       // }
//            else {
//                print("College already exists")
//            }
            
        }
        
    }
    @IBAction func nextOfCollege(_ sender: Any) {
        
        let studentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"StudentViewController") as! StudentViewController
        present(studentViewController, animated: true, completion: nil)
        studentViewController.studentCollegeName = collegeNameText.text
        studentViewController.studentCollegeId = Int(collegeIdText.text!)
       // self.navigationController?.pushViewController(studentViewController, animated: true)
        
    }
    
    @IBAction func listOfAllCollegesButton(_ sender: Any) {
        
        fetchCollege()
        let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"DetailViewController") as! DetailViewController
       present(detailsViewController, animated: true, completion: nil)
        
       // self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    
    func fetchCollege(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request =  NSFetchRequest<College>(entityName: "College")
        
        do {
           let objects = try context.fetch(request)
            //print(objects)
             SharedData.arrayOfColleges = objects
            for item in objects {
                print(item.collegeName!)
                print(item.collegeId)
           //  print(item.collegeStudents!)
                let array = item.collegeStudents?.allObjects as! [Student]
                for (count,items) in array.enumerated(){
                   print("Student \(count+1) name is \(String(describing: items.studentName!))")
                    print("Student \(count+1) id is \(items.studentId)")
                }
            }
                
            
        }
        catch {
            }
    }
}

