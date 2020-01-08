//
//  SchoolsListViewModel.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

protocol SchoolsListDelegates {
    func didUpdate()
    func didSelectSchool(school: SchoolViewModel)
    func updateSchools(schoolList: [SchoolViewModel]?)
    static var schools: [SchoolViewModel] { get }
}

extension SchoolsListDelegates {
    func updateSchools(schoolList: [SchoolViewModel]?){}
    func didUpdate(){}
    static var schools: [SchoolViewModel] { return [SchoolViewModel]()}
}

class SchoolsListViewModel: NSObject {
    private var schoolsListDic = Dictionary<String, [SchoolViewModel]>()
    static var schoolList = [SchoolViewModel]()
    private var schoolSections = [String]()
    
    var delegate: SchoolsListDelegates!
    
    override init() {
        super.init()
        
        Webservices.fecthSchools { [weak self] (data) in
            SchoolsListViewModel.schoolList.removeAll()
            guard let data = data else { return }
            for dataJson in data {
                if let dataJson = dataJson {
                    let schoolVM = SchoolViewModel(data: dataJson)
                    if !schoolVM.schoolName.isEmpty {
                        SchoolsListViewModel.schoolList.append(schoolVM)
                    }
                }
            }
            
            self?.schoolsListDic = Dictionary(grouping: SchoolsListViewModel.schoolList) { (element) -> String in
                return "\(element.section)"
            }
            
            
            self?.schoolSections = (self?.schoolsListDic.compactMap({ (element) -> String in
                return element.key
            }))!
            self?.schoolSections.sort()

            DispatchQueue.main.async {
                print("OUTSIDE DELEGATE")
                if self?.delegate != nil {
                    print("INSIDE DELEGATE")
                    self?.delegate.didUpdate()
                    self?.delegate.updateSchools(schoolList: SchoolsListViewModel.schoolList)
                }
            }
        }
    }
    
    fileprivate var numberOfSections: Int {
        return self.schoolSections.count
    }
    
    fileprivate func schoolSectionAt(section: Int) -> String {
        return self.schoolSections[section]
    }
    
    fileprivate func numberOfRowsAtSection(section: Int) -> Int {
        let schoolSection: String = schoolSectionAt(section: section)
        return self.schoolsListDic[schoolSection]?.count ?? 0
    }
    
    fileprivate func schoolForRowAt(indexPath: IndexPath) -> SchoolViewModel {
        let schoolSection: String = schoolSectionAt(section: indexPath.section)
        return schoolsListDic[schoolSection]![indexPath.row]
    }
}

extension SchoolsListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRowsAtSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolListCell.cellIdentifier, for: indexPath) as! SchoolListCell
        cell.setupCell(school: self.schoolForRowAt(indexPath: indexPath))
        return cell
    }
}

extension SchoolsListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.delegate != nil {
            self.delegate.didSelectSchool(school: schoolForRowAt(indexPath: indexPath))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.schoolSectionAt(section: section)
    }
}
