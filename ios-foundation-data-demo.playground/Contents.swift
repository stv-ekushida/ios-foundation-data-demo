//: Playground - noun: a place where people can play

import UIKit

/*
 Data <-> オブジェクト
 */
let array = ["hoeg", "fuga"]

// ArrayをDataに変換
let arrayData = NSKeyedArchiver.archivedData(withRootObject: array)

// DataからArrayに変換（戻り値の型はAny?）
let unarchivedArray = NSKeyedUnarchiver.unarchiveObject(with: arrayData)

// 変換前後の配列を比較（unarchivedArrayはAny?なのでダウンキャスト必要）
array == unarchivedArray as! [String]

/*
 Data <-> String
 */
let string = "demo"

// StringをDataに変換（戻り値Data?）
let stringData = string.data(using: .utf8) ?? Data()

// DataをStringに変換（戻り値String?）
let stringFromData = String(data: stringData, encoding: .utf8) ?? "変換失敗"

/*
 encode / decode
 */
let url = URL(string: "https://www.google.com/images/srpr/logo11w.png")

// URLからData生成
let urlData = try! Data(contentsOf: url!)

// base64 encode
let base64EncodedStr = urlData.base64EncodedData()

// decode
let base64DecodedData = Data(base64Encoded: base64EncodedStr)

/*
 その他
 */
// 空チェック
urlData.isEmpty

// 長さ取得
urlData.count
