//
//  Model.swift
//  BookMyShow_Assignment
//
//  Created by SnehaAgrawal on 07/01/23.
//

import Foundation

struct ChildrenData: Codable, Identifiable {
    let id = UUID()
    let name : String?
    let university : String?
    let gpa : Double?
    let skills : String?
}
