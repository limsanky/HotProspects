//
//  FileManager-Extension.swift
//  HotProspects
//
//  Created by Sankarshana V on 2022/02/08.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = self.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
