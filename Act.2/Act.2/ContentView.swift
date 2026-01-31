//
//  ContentView.swift
//  Act.2
//
//  Created by Alumno on 28/1/26.
//

import SwiftUI

struct ContentView: View {

    var nombre = "Adriana"
    var edad = "20"

    var experiencia = [
        "Certificado en Tecnologías de la Información",
        "Aplicación de venta de artesanías"
    ]

    var education = [
        ("Universidad del Golfo de México", "2020–2023", false),
        ("Universidad TecMilenio", "2023–Presente", true)
    ]

    @State private var mostrarAlerta = false
    @State private var isEnabled = false
    @State private var valor: Double = 50

    var body: some View {
        VStack(spacing: 15) {

            Image("perfil")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())

            Text("Nombre: \(nombre)")
            Text("Edad: \(edad)")

            Text("Experiencia:")
                .font(.headline)

            ForEach(experiencia, id: \.self) { proyecto in
                Text("- \(proyecto)")
            }

            Text("Formación Académica:")
                .font(.headline)

            ForEach(education, id: \.0) { escuela in
                VStack(alignment: .leading) {
                    Text("- \(escuela.0) (\(escuela.1))")
                    Text(escuela.2 ? "En curso" : "Finalizado")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Button("Cursos") {
                mostrarAlerta = true
            }
            .alert("Cursos en 2025", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("""
                Curso 1: Big Data
                Curso 2: Computer Vision
                Curso 3: Data Science
                """)
            }

            Toggle("Perfil", isOn: $isEnabled)

            Text(isEnabled ? "Developer" : "Scrum Master")
                .foregroundColor(isEnabled ? .green : .red)

            Text("Nivel: \(Int(valor))")
            Slider(value: $valor, in: 0...100, step: 1)

        }
        .padding()
        .background(Color.blue.opacity(0.1)) // fondo sencillo
    }
}

#Preview {
    ContentView()
}
