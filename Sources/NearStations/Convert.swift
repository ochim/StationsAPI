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
            let rows = csvStr.components(separatedBy: .newlines)
            for row in rows {
                let columns = row.components(separatedBy: ",")
                result.append(columns)
            }
            result.remove(at: result.count-1)

            return result
            

        } catch {
            return []
        }
    }
}
