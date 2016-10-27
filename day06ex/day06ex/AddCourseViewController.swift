//
//  AddCourseViewController.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {

    @IBOutlet weak var courseNametf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Course"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func OKButton(_ sender: AnyObject) {
        DataManager.shared.createNewCourses(name: courseNametf.text!)

        let courseVC = self.navigationController?.viewControllers[0] as! CourseViewController
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!
            , animated: true)

        courseVC.tableView.reloadData()
        courseVC.viewDidLoad()
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
