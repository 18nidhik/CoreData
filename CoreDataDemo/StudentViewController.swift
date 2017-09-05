//
//  StudentViewController.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 04/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import UIKit
import CoreData

class StudentViewController: UIViewController {
    
    @IBOutlet weak var studentNameText: UITextField!
    @IBOutlet weak var studentIdTect: UITextField!

   var studentCollegeName : String?
   var studentCollegeId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          navigationItem.title = "Student Details"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveStudent(_ sender: Any) {
    
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
        context.perform {
            let studentEntity: Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
              studentEntity.studentName = self.studentNameText.text
            guard self.studentIdTect.text?.isEmpty == false else {
                return
            }
            if  let studentIdNumber = Int32(self.studentIdTect.text!){
                studentEntity.studentId = studentIdNumber
            }
            
            let request = NSFetchRequest<College>(entityName: "College")
            let predicate = NSPredicate(format: "collegeName CONTAINS[cd] %@", self.studentCollegeName!)
            request.predicate = predicate
            do {
                let objects = try context.fetch(request)
                print(objects)
                objects.first?.addToCollegeStudents(studentEntity)
              //  studentEntity.studentCollege = objects.first
            }
                
            catch {
                
            }
        
            do{
                try context.save()
            }
            catch let error{
                print(error)
            }
        }

    }
    
    @IBAction func studentTableList(_ sender: Any) {
        
        fetchStudent()
        
        let studentsTableView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"StudentsTableViewController") as! StudentTableView
        //present(studentsTableView, animated: true, completion: nil)
        self.navigationController?.pushViewController(studentsTableView, animated: true)
    }
    
    func fetchStudent(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request =  NSFetchRequest<Student>(entityName: "Student")
        
        do {
            let objects = try context.fetch(request)
            SharedData.arrayOfStudents = objects
            print(objects)
            SharedData.arrayOfStudents = objects
            for item in SharedData.arrayOfStudents {
                print("Student name is \(item.studentName!)")
                print("Student id is \(item.studentId)")
                if let studentCollegeName = item.studentCollege?.collegeName{
                print( "Student college is \(studentCollegeName)")
                }
           }
        }
        catch {
        }
    }
    

}
