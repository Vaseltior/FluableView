//
// The MIT License (MIT)
//
// Copyright (c) 2015 Samuel GRAU
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

//
//  FluableView : UpdatableTableViewCell.swift
//
//  Created by Samuel Grau on 02/03/2016.
//  Copyright © 2016 Samuel GRAU. All rights reserved.
//

import Foundation

/**
- author: Samuel GRAU, 16-03-02 22:03:47

The protocol for a cell that could be updated.

Cells that implement this protocol are given the object that implemented the AVNICellObject
protocol and returned this cell's class name in @link AVNICellObject::cellClass cellClass@endlink.
*/
public protocol UpdatableTableViewCell {
  /**
   Called when a cell is created and reused.
   Implement this method to customize the cell's properties for display using the given object.
   
   - parameter object: the object model used to update the viez
   
   - returns: `true` if the update is needed, otherwise returns `false`
   */
  func shouldUpdateCellWithObject(object: TableViewCellModel) -> Bool
  
  ///
  /// Asks the receiver whether the mapped object class should be appended to the reuse identifier
  /// in order to create a unique cell.object identifier key.
  ///
  /// This is useful when you have a cell that is intended to be used by a variety of different
  /// objects.
  ///
  static func shouldAppendObjectClassToReuseIdentifier() -> Bool
  
  /**
   Asks the receiver to calculate its height.
   
   - parameter object:    the object model used to update the view
   - parameter indexPath: the index path of the object
   - parameter tableView: the table view targeted by the height computation
   
   - returns: the height in points
   */
  static func heightForObject(object: TableViewCellModel, atIndexPath indexPath: NSIndexPath, tableView: UITableView) -> CGFloat
  
}
