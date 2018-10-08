//
//  ViewController.swift
//  xmlbook
//
//  Created by D7703_23 on 2018. 10. 2..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
    @IBOutlet weak var TableView: UITableView!
    
    
    // 딕셔너리의 배열 저장 : item
    var item:[[String:String]] = []
    
    // 딕셔너리 : item [key:value]
    var elements:[[String:String]] = []
    
    var currentElement = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
        if let path = Bundle.main.url(forResource: "book", withExtension: "xml") {
            
            if let paser = XMLParser(contentsOf: path) {
                paser.delegate = self
                
                if paser.parse() {
                    print("파싱 성공")
                    
                    print(elements)
                    
                } else {
                    print("파싱 오류2")
                }
            } else {
                print("파싱 오류1")
            }
        } else {
            print("XML 파일 없음")
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if !data.isEmpty {
            elements[currentElement] = data
        }
        
}
}
