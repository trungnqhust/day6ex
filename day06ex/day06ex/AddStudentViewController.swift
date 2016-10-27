
//
//  AddStudentViewController.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import UIKit
import CoreData

class AddStudentViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var course : Courses!

//    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addresstf: UITextField!
    @IBOutlet weak var nametf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Student"
        self.addresstf.delegate = self
        self.nametf.delegate = self
        imageView.image = UIImage(named: "user.png")
        // Do any additional setup after loading the view.

    }


//    @IBAction func loadImage(_ sender: AnyObject) {
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .photoLibrary
//        
//        present(imagePicker, animated: true, completion: nil)
//
//        
//    }
    
    @IBAction func addPhoto(_ sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = pickedImage
            
        }
        dismiss(animated: true, completion: nil)
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            self.imageView.image = image
//        }
//        dismiss(animated: true, completion: nil)
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//        
//    }
    
    @IBAction func OKButton(_ sender: AnyObject) {
        let date : NSDate!
        date = datePicker.date as NSDate!
        let imageData = UIImageJPEGRepresentation(imageView.image!, 1.0) as NSData!
        
        DataManager.shared.createNewStudent(address: addresstf.text!, birthday: date , image: imageData!, name: nametf.text!, belong : course)
        
        let studentVC = self.navigationController?.viewControllers[1] as! StudentViewController
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!
            , animated: true)
        studentVC.tableViewStudents.reloadData()
        studentVC.viewDidLoad()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    func dismissKeyboard() {
        view.endEditing(true)
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
