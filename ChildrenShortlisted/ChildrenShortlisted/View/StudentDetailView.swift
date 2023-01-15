//
//  StudentDetailView.swift
//  BookMyShow_Assignment
//
//  Created by SnehaAgrawal on 08/01/23.
//

import SwiftUI

struct StudentDetailView: View {
    var name:String
    var university: String
    var gpa: Double
    var skills: String
    @State var shortlistButton : Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("\(name)").font(.system(size: 25, weight: .semibold))
            Text("\(university)").font(.system(size: 20, weight: .medium))
            Text("\(gpa)").font(.system(size: 15, weight: .regular))
            Text("\(skills)").font(.system(size: 15, weight: .semibold))
            Spacer()
        }.padding().tint(.black)
    }
}

