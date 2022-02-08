//
//  Prospect.swift
//  HotProspects
//
//  Created by Sankarshana V on 2022/02/08.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
//        Using UserDefaults
//        if let data = UserDefaults.standard.data(forKey: "SavedData") {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
        
//        Using FileManager Documents Directory
        if let data = try? Data(contentsOf: savePath) {
            if let decodedArray = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decodedArray
                return
            }
        }
        
        // No saved data present
        people = []
    }
    
    private func save() {
//         Using UserDefaults
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: "SavedData")
//        }
        
//         Using FileManager Documents Directory
        if let encodedData = try? JSONEncoder().encode(people) {
            try? encodedData.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
    
    // MARK: - Intent(s)
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
