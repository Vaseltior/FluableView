//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import FluableView

extension NSIndexPath {
  public override var description: String { return "section \(self.section) item \(self.item)" }
}


let tableView = UITableView(frame: CGRectMake(0, 0, 320, 480), style: .Grouped)
tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: String(TableViewCell))
/*
var model: TableModel<String> = []

//model.append("Bob", toSection: 0)
model.append("Bear")
model.append(["Cat"])
model.append(["Cat", "Donkey"])
model.append("Bear")

tableView.dataSource = model*/

XCPlaygroundPage.currentPage.liveView = tableView

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
  
  XCPlaygroundPage.currentPage.finishExecution()
}
