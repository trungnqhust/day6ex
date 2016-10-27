//
//  DataManager.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import UIKit

class DataManager {
    static let shared : DataManager = DataManager()
    func createNewStudent(address: String, birthday: NSDate, image: NSData, name: String, belong : Courses ) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appDelegate.getObjectContext()
        
        let student = Students(context: context)
        
        student.name = name
        student.address = address
        student.birthday = birthday
        student.image = image
        student.addToBelong(belong)
        belong.addToContain(student)
        belong.numberOfStudents += 1
        do {
            try appDelegate.saveContext()
        } catch {
            print(error)
        }
    }
    func listAllCourses() -> [Courses]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appDelegate.getObjectContext()
        do {
            let fetchResults = try context.fetch(Courses.fetchRequest())
            return fetchResults as? [Courses]
        } catch  {
            print(error)
            return nil
        }
    }
    
    func createNewCourses(name: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appDelegate.getObjectContext()
        
        let course = Courses(context: context)
        
        course.numberOfStudents = 0;
        course.name = name
        
        do {
            try appDelegate.saveContext()
        } catch {
            print(error)
        }
    }
    func deleteCourses(course : Courses) {
        // 1. Get context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getObjectContext()
        context.delete(course)
        // 3. Save data
        do {
            try appDelegate.saveContext()
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    func deleteStudents(student : Students, course : Courses) {
        // 1. Get context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getObjectContext()

        course.removeFromContain(student)
        course.numberOfStudents -= 1
        context.delete(student)
        // 3. Save data
        do {
            try appDelegate.saveContext()
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
