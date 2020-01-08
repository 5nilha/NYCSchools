//
//  SchoolsListViewController.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class SchoolsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var schoolsListViewModel: SchoolsListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.schoolsListViewModel = SchoolsListViewModel()
        self.schoolsListViewModel.delegate = self
        self.tableView.delegate = schoolsListViewModel
        self.tableView.dataSource = schoolsListViewModel
        self.navigationItem.title = "Schools List"
    }
    

}

extension SchoolsListViewController: SchoolsListDelegates {
    func didUpdate() {
        self.tableView.reloadData()
    }
    
    func didSelectSchool(school: SchoolViewModel) {
        //TODO:
    }
}

extension SchoolsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsListViewModel != nil ? schoolsListViewModel.tableView(tableView, numberOfRowsInSection: section) : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return schoolsListViewModel.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return schoolsListViewModel.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return schoolsListViewModel.tableView(tableView, heightForRowAt: indexPath)
    }
    
}
