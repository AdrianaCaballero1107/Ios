//
//  ContentView.swift
//  AdrianaResume
//
//  Created by Alumno on 28/1/26.
//



import SwiftUI

struct ContentView: View {
    var nombre = "Adriana"
    let edad = 20
    var experiencia = ["Proyecto 1", "Proyecto 2", "Proyecto 3"]
    var body: some View{
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Nombre: \(nombre) edad: \(edad)")
            
            ForEach (experiencia, id: \.self) { proyecto in Text("\(proyecto)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
