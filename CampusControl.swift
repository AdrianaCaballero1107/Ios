//
//  main.swift
//  Clase_12
//
//  Created by Adriana Caballero on 23/04/26.
//

import Foundation

enum Level: String {
    case basico, intermedio, avanzado
}

enum AcademicStatus: String {
    case reprobado = "Reprobado"
    case aprobado = "Aprobado"
    case excelente = "Excelente"
}

struct Student {
    let id: Int
    let name: String
    let age: Int
    let email: String
}

class Enrollment {
    let student: Student
    let courseCode: String
    var grades: [Double] = []
    
    var finalGrade: Double {
        return grades.isEmpty ? 0 : grades.reduce(0, +) / Double(grades.count)
    }
    
    var academicStatus: AcademicStatus {
        let score = finalGrade
        if score < 6 { return .reprobado }
        if score < 9 { return .aprobado }
        return .excelente
    }
    
    init(student: Student, courseCode: String) {
        self.student = student
        self.courseCode = courseCode
    }
    
    func insertGrade(_ value: Double) {
        guard value >= 0 && value <= 10 else { return }
        grades.append(value)
    }
}

class Course {
    let id: String
    let title: String
    let level: Level
    let limit: Int
    var members: [Int] = []
    
    init(id: String, title: String, level: Level, limit: Int) {
        self.id = id
        self.title = title
        self.level = level
        self.limit = limit
    }
}

class CampusSystem {
    private var studentRegistry: [Int: Student] = [:]
    private var courseRegistry: [String: Course] = [:]
    private var activeEnrollments: [Enrollment] = []
    
    func registerStudent(id: Int, name: String, age: Int, mail: String) {
        guard !name.isEmpty, age >= 16, mail.contains("@") else { return }
        studentRegistry[id] = Student(id: id, name: name, age: age, email: mail)
        print("Estudiante \(name) agregado correctamente.")
    }
    
    func registerCourse(id: String, title: String, level: Level, limit: Int) {
        courseRegistry[id] = Course(id: id, title: title, level: level, limit: limit)
        print("Curso \(title) agregado correctamente.")
    }
    
    func enroll(studentId: Int, courseId: String) {
        guard let student = studentRegistry[studentId],
              let course = courseRegistry[courseId] else { return }
        
        guard course.members.count < course.limit,
              !course.members.contains(studentId) else { return }
        
        course.members.append(studentId)
        activeEnrollments.append(Enrollment(student: student, courseCode: courseId))
        print("Inscripción realizada correctamente.")
    }
    
    func addGrade(for studentId: Int, in courseId: String, score: Double) {
        let match = activeEnrollments.first { $0.student.id == studentId && $0.courseCode == courseId }
        match?.insertGrade(score)
        
        if let name = studentRegistry[studentId]?.name, match != nil {
            print("Calificación \(score) agregada a \(name).")
        }
    }
    
    func showFinalReport() {
        print("=== REPORTE FINAL ===")
        activeEnrollments.forEach { record in
            let courseTitle = courseRegistry[record.courseCode]?.title ?? "N/A"
            print("Estudiante: \(record.student.name)")
            print("Curso: \(courseTitle)")
            print("Calificaciones: \(record.grades)")
            print("Promedio: \(record.finalGrade)")
            print("Estado: \(record.academicStatus.rawValue)")
            print("----------------------")
        }
    }
}

let campus = CampusSystem()

campus.registerStudent(id: 1, name: "Ana", age: 21, mail: "ana@correo.com")
campus.registerCourse(id: "SW-01", title: "Swift Básico", level: .basico, limit: 20)
campus.enroll(studentId: 1, courseId: "SW-01")
campus.addGrade(for: 1, in: "SW-01", score: 9.5)
campus.addGrade(for: 1, in: "SW-01", score: 8.0)
campus.showFinalReport()
