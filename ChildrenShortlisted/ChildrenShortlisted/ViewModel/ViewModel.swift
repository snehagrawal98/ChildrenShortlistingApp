//
//  ViewModel.swift
//  BookMyShow_Assignment
//
//  Created by SnehaAgrawal on 07/01/23.
//

import Foundation

class ApiCall {
    
    //Api call function to fetch the json response
    func getUsers(completion:@escaping ([ChildrenData]) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/1f279003-f26e-4af9-8e34-f0f2b82c7f13") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try? JSONDecoder().decode([ChildrenData].self, from: data!)
            print(users)
            DispatchQueue.main.async {
                completion(users!)
            }
        }
        .resume()
    }
}
