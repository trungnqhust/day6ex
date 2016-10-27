//
//  CourseViewController.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var courses : [Courses]!
    var currentRowSellected  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.title = "Courses"
        courses = DataManager.shared.listAllCourses()
        print("number of courses: \(courses.count)")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("course.count in numberofRow: \(courses.count)")
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        let courseNameLabel = cell.contentView.viewWithTag(11) as! UILabel
        let nOS = cell.contentView.viewWithTag(12) as! UILabel        
        print("index path.row = \(indexPath.row)")
        courseNameLabel.text = courses[indexPath.row].name
        nOS.text = String(courses[indexPath.row].numberOfStudents)
        return cell        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRowSellected = indexPath.row
        self.performSegue(withIdentifier: "CourseViewToStudentView", sender: nil)
        print("sellected row: ", indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "DELETE") { action, index in
            DataManager.shared.deleteCourses(course: self.courses[indexPath.row])
            self.viewDidLoad()
            self.tableView.reloadData()
        }
        delete.backgroundColor = UIColor.red

        return [delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        // you need to implement this method too or you can't swipe to display the actions
//    }
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "CourseViewToStudentView"){
            let studentViewController = segue.destination as! StudentViewController
            studentViewController.students = courses[currentRowSellected].contain
            studentViewController.title =  courses[currentRowSellected].name! 
            studentViewController.course = courses[currentRowSellected]
        }
       
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
