//
//  ViewController.swift
//  Notes App
//
//  Created by Sagar Baloch on 09/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    

    static var shared = ViewController()
    var myTableView:UITableView = UITableView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cellArray = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Notes"
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(dismissKeyBoard))
        setupTableView()
        setNavButton()
        loadData()
    }
    
    @objc func dismissKeyBoard(){
        self.resignFirstResponder()
    }
}
//MARK: - Views Setup Methods

extension ViewController{
    
    func setupTableView(){
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "myCell")
        view.addSubview(myTableView)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
//MARK: - Table View Data Source Methods

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        cell.title.text = cellArray[indexPath.row].title
        cell.subTitle.text = cellArray[indexPath.row].subTitle
        return cell
    }
}
//MARK: - Table View Delegate Methods
extension ViewController:UITableViewDelegate{
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notesVC = NotesViewController()
        notesVC.modalPresentationStyle = .fullScreen
        notesVC.cell = cellArray[indexPath.row]
        self.present(notesVC, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
//MARK: - Database Methods

extension ViewController{
    func saveData(){
        do{
            try context.save()
        }catch{
            print("Error \(error)")
        }
    }
    
    func loadData() {
        let request: NSFetchRequest<CellData> = CellData.fetchRequest()
        do{
            try cellArray = context.fetch(request)
        }catch{
            print("Error \(error)")
        }
        self.myTableView.reloadData()
    }
}
//MARK: - Navigation Controller Methods

extension ViewController{
    func setNavButton(){
        let navButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(buttonPressed))
        navigationItem.rightBarButtonItem = navButton
        self.navigationController?.navigationBar.setItems([navigationItem], animated: false)
    }
    
    @objc func buttonPressed(){
        let dataVC = DataViewController()
        dataVC.modalPresentationStyle = .fullScreen
        dataVC.completionHandler = { cell in
            self.cellArray.append(cell)
            self.saveData()
            self.loadData()
        }
        self.present(dataVC, animated: true, completion: nil)
    }
}

class Cell{
    
    var title:String
    var subTitle:String
    init(title:String,subTitle:String) {
        self.title = title
        self.subTitle = subTitle
    }
}


//MARK: - Remaining Tasks
/*
 
 - Add swipe gesture for back
 - Add main Title in NotesViewController
 
 */
