
//
//  StudentViewController.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var course : Courses!    
    @IBOutlet weak var tableViewStudents: UITableView!
    var students : NSSet!
    @IBAction func addButton(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "SegueStudentToAddNewStudent", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueStudentToAddNewStudent"){
            let addStudentVC = segue.destination as! AddStudentViewController
            addStudentVC.course = course
        }
    }
    var studentsArr : [Students]!
    @IBOutlet weak var addButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewStudents.delegate = self
        self.tableViewStudents.dataSource = self
        // Do any additional setup after loading the view.
        studentsArr = Array(students) as! [Students]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewStudents.dequeueReusableCell(withIdentifier: "NameCellStudent", for: indexPath)
        let studentName = cell.contentView.viewWithTag(22) as! UILabel
        let studentAddress = cell.contentView.viewWithTag(23) as! UILabel
        let studentBirthday = cell.contentView.viewWithTag(24) as! UILabel
        let image = cell.contentView.viewWithTag(21) as! UIImageView

        studentName.text = studentsArr[indexPath.row].name
        studentAddress.text = studentsArr[indexPath.row].address
        let dateString : String!
        dateString = String(describing: studentsArr[indexPath.row].birthday!)
        let imageData = studentsArr[indexPath.row].image! as Data
        image.image = UIImage(data: imageData)
        studentBirthday.text = dateString
        
//        let currentStudent = students. [indexPath.row] as Students
//        studentName.text = .name
//        studentAddress.text = String(courses[indexPath.row].numberOfStudents)
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "DELETE") { action, index in
            DataManager.shared.deleteStudents(student: self.studentsArr[indexPath.row], course : self.course)
            self.viewDidLoad()
            self.tableViewStudents.reloadData()
        }
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
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
