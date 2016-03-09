/*
Copyright 2011-present Samuel GRAU

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

//
//  FluableView : TableViewCell.swift
//

import Foundation
import UIKit

public class TableViewCell: UITableViewCell, UpdatableTableViewCell {
  
  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.commonInitialization()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonInitialization()
  }
  
  public func commonInitialization() {
  }
  
  /**
   Called when a cell is created and reused.
   Implement this method to customize the cell's properties for display using the given object.
   
   - parameter object: the object model used to update the view
   - parameter indexPath: the location of that cell in the tableview
   
   - returns: `true` if the update is needed, otherwise returns `false`
   */
  public func shouldUpdateCellWithObject(object: TableCellObject, indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  /**
   Called when a cell is created and reused.
   Implement this method to customize the cell's properties for display using the given object.
   
   - parameter object: the object model used to update the viez
   - parameter indexPath: the location of that cell in the tableview
   
   */
  public func updateCellWithObject(object: TableCellObject, indexPath: NSIndexPath) {
    
  }
  
  /**
   Asks the receiver whether the mapped object class should be appended to the reuse identifier
   in order to create a unique cell.object identifier key.
   This is useful when you have a cell that is intended to be used by a variety of different objects.
   
   - returns: `true` if the reuse identifier should be appended by the class name, otherwise returns `false`.
   */
  public static func shouldAppendObjectClassToReuseIdentifier() -> Bool {
    return false
  }
  
  /**
   Asks the receiver to calculate its height.
   
   - parameter object:    the object model used to update the view
   - parameter indexPath: the index path of the object
   - parameter tableView: the table view targeted by the height computation
   
   - returns: the height in points
   */
  public static func heightForObject(object: TableCellObject, atIndexPath indexPath: NSIndexPath, tableView: UITableView) -> CGFloat {
    return 44.0 // Let's say that this is the default height
  }
}
