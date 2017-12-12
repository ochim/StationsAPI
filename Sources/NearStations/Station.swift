//
//  Station.swift
//  HelloPackageDescription
//
//  Created by 越智宗洋 on 2017/12/10.
//

import Foundation

struct Station {

    func calcDistance(lat1: Double, lng1: Double, lat2: Double, lng2: Double) -> Double{
        let Re = 6378.137 // 地球の半径
        let (x1, y1, z1) = rectangularCoordinateSystem(lat:lat1, lng:lng1)
        let (x2, y2, z2) = rectangularCoordinateSystem(lat:lat2, lng:lng2)
        return Re * acos(x1*x2 + y1*y2 + z1*z2)
    }
    /** 付近の駅を取得 **/
    func getNearStations (lat: Double, lng: Double) -> [[String:String]] {
        
        let stations = Convert.convertCSV()
        
        var array: [[String:String]] = []
        for station:[String] in stations {
            var dic :[String:String] = [:]
            let distance = calcDistance(lat1:lat, lng1:lng, lat2:atof(station[10]), lng2:atof(station[9]))
            dic["km"] = String(format:"%f", distance)
            dic["name"] = station[2]
            array.append(dic)
        }
        array = array.sorted(by: { $0["km"]! < $1["km"]! })
        return array[0...2].map{$0}
    }
    
    func radians (deg: Double) -> Double {
        return deg * Double.pi / 180
    }
    
    func rectangularCoordinateSystem (lat: Double, lng: Double) -> (Double,Double,Double) {
        let h = radians(deg:lat)
        let t = radians(deg:lng)
        let x = cos(h) * cos(t)
        let y = cos(h) * sin(t)
        let z = sin(h)
        return (x, y, z)
    }
    
}
