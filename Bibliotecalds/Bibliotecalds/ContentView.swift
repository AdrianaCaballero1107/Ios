//
//  ContentView.swift
//  Bibliotecalds
//
//  Created by Alumno on 11/2/26.
//

import SwiftUI

struct Book {
    let title: String
    let author: String
    let year: String
    let imageName: String
}

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var sizeClass
    
    let books = [
        Book(title: "Clean Architecture", author: "Robert C. Martin", year: "2017", imageName: "libro1"),
        Book(title: "The Pragmatic Programmer", author: "Andrew Hunt & David Thomas", year: "1999", imageName: "libro2"),
        Book(title: "Code Complete", author: "Steve McConnell", year: "2004", imageName: "libro3"),
        Book(title: "Design Patterns", author: "Gamma, Helm, Johnson & Vlissides", year: "1994", imageName: "libro4"),
        Book(title: "Refactoring", author: "Martin Fowler", year: "1999", imageName: "libro5"),
        Book(title: "Clean Code", author: "Robert C. Martin", year: "2008", imageName: "libro6"),
        Book(title: "Introduction to Algorithms", author: "Cormen et al.", year: "2009", imageName: "libro7"),
        Book(title: "The Mythical Man-Month", author: "Frederick P. Brooks Jr.", year: "1975", imageName: "libro8"),
        Book(title: "You Don't Know JS", author: "Kyle Simpson", year: "2015", imageName: "libro9"),
        Book(title: "Cracking the Coding Interview", author: "Gayle McDowell", year: "2015", imageName: "libro10")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text("Biblioteca de Software")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(sizeClass == .compact ? .white : .black)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                
                ForEach(books.indices, id: \.self) { index in
                    
                    HStack {
                        Image(books[index].imageName)
                            .resizable()
                            .frame(width: 100, height: 130)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(books[index].title)
                                .font(.headline)
                                .foregroundColor(sizeClass == .compact ? .white : .black)
                            
                            Text("Autor: \(books[index].author)")
                                .bold()
                                .foregroundColor(sizeClass == .compact ? .white : .black)
                            
                            Text("Año: \(books[index].year)")
                                .italic()
                                .foregroundColor(sizeClass == .compact ? .white : .black)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .background(Color.brown.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
