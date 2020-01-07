//
//  SchoolListCell.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class SchoolListCell: UITableViewCell {
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var schoolAddress: UILabel!
    
    static let cellIdentifier = "SchoolListCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.schoolAddress.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(school: SchoolViewModel) {
        self.schoolNameLabel.text = school.schoolName
        self.schoolAddress.text = school.address
    }

}
