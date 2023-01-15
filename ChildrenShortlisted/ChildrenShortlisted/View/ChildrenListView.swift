//
//  ChildrenListView.swift
//  BookMyShow_Assignment
//
//  Created by SnehaAgrawal on 08/01/23.
//

import SwiftUI

struct ChildrenListView: View {
    
    @State var childrenViewModel : [ChildrenData] = []
    @State var shortlistButton : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(childrenViewModel) { child in
                    NavigationLink {
                        StudentDetailView(name: child.name ?? "", university: child.university ?? "" , gpa: child.gpa ?? 0.0, skills: child.skills ?? "", shortlistButton: self.shortlistButton).tint(Color.black)
                    } label: {
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 12){
                                Text("Name:")
                                Text("University:")
                                Text("GPA:")
                                Text("Skills:")
                            }.foregroundColor(.black).font(.system(size: 15, weight: .semibold))
                            
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(alignment: .top) {
                                    Text("\(child.name ?? "")").foregroundColor(.black)
                                    Spacer()
                                    ShortlistButton(child: child, id: child.id, name: child.name ?? "")
                                }
                                
                                VStack(alignment: .leading, spacing: 12){
                                    Text("\(child.university ?? "")")
                                    Text("\(child.gpa ?? 0.0)")
                                    Text("\(child.skills ?? "")").lineLimit(nil).multilineTextAlignment(.leading).frame(maxHeight: .infinity).fixedSize(horizontal: false, vertical: true)
                                    
                                }.offset(y:-8).foregroundColor(.black)
                                
                            }.font(.system(size: 15, weight: .regular))
                        }
                        Divider()
                    }
                    
                }
            }.padding(5).onAppear() {
                ApiCall().getUsers { (childrenViewModel) in
                    self.childrenViewModel = childrenViewModel
                }
            }.navigationTitle("Swift Student Challenge").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChildrenListView_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenListView()
    }
}

struct ShortlistButton: View{
    let child: ChildrenData
    var id: UUID
    var name: String
    @State var shortlistButton : Bool = false
    @State var shortlistEndButton : Bool = false
    @State var disableButton : Bool = false

    var body: some View {
        
        Button {
            shortlistButton = true
            shortlistEndButton = true
            if shortlistButton {
                disableButton = true
            }
            
            print(id)
        } label: {
        Text(shortlistEndButton ? "Shortlisted" : "Shortlist").frame(height: 15,alignment: .center).padding(6).background(shortlistEndButton ? Color.gray.opacity(0.3) : Color.blue).cornerRadius(5).fontWeight(.medium).foregroundColor(shortlistEndButton ? .black : .white)
            
        }.disabled(disableButton).alert("\(name) shortlisted", isPresented: $shortlistButton) {
            Button("OK", role: .cancel) { $shortlistEndButton }
        }

    }
}
