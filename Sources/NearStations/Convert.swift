//
//  Convert.swift
//  HelloPackageDescription
//
//  Created by 越智宗洋 on 2017/12/11.
//

import Foundation
import HexavilleFramework

struct Convert {

    static func convertCSV() -> [[String]] {
        do {
            let asset = AssetLoader.shared.availableAbsolutePathForAssets()
            let csvPath = "\(asset!)/station20171109free.csv"
            let csvStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
            
            var result: [[String]] = []
            var rows = csvStr.components(separatedBy: .newlines)
            rows.remove(at: 0)
            rows.remove(at: rows.count-1)
            
            for row in rows {
                let columns = row.components(separatedBy: ",")
                result.append(columns)
            }
 
            return result
            
        } catch {
            return [[]]
        }
    }
}
