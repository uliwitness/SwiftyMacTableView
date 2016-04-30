//
//  AppDelegate.swift
//  TableView
//
//  Created by Uli Kusterer on 30/04/16.
//  Copyright © 2016 Uli Kusterer. All rights reserved.
//

import Cocoa


public class Row: NSObject {
    var name: String = ""
    var explanation: String = ""
    var image: NSImage?
    
    init( name inName: String, explanation inExplanation: String, image inImageName: String ) {
        name = inName
        explanation = inExplanation
        image = NSImage(named: inImageName)
    }
}

@NSApplicationMain
public class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet var rowsTable: NSTableView!
    @IBOutlet var window: NSWindow!
    
    var rows: [Row] = []
    
    @IBAction func addNewRow(sender: AnyObject) {
        rows.append( Row( name: "New", explanation: "New Ex", image: NSImageNameColorPanel) )
        rowsTable.reloadData()
    }

    public func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return rows.count
    }
    
    public func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        return rows[row]
    }

    public func applicationDidFinishLaunching(aNotification: NSNotification) {
        rows = [ Row( name: "User", explanation: "One Ex", image: NSImageNameUser),
                 Row( name: "Folder", explanation: "Two Ex", image: NSImageNameFolder),
                 Row( name: "Bonjour", explanation: "Three Ex", image: NSImageNameBonjour)
                ]
        rowsTable.reloadData()
    }
}

