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
//  FluableView : TableCellFactory.swift
//

import Foundation

/**
 A protocol for TableViewModel to fetch rows to be displayed for the table view.
 */
public protocol TableViewModelDelegate {
  /**
   Fetches a table view cell at a given index path with a given object.
   The implementation of this method will generally use object to customize the cell.
   
   - parameter tableViewModel: the model
   - parameter tableView:      the table view
   - parameter indexPath:      the location of the cell in the tableview
   - parameter object:         the object
   
   - returns: A table view cell object
   */
  func tableViewModel(
    tableViewModel: Model,
    cellForTableView tableView: UITableView,
    atIndexPath indexPath: NSIndexPath,
    withObject object: TableCellObject) throws -> TableViewCell
}

enum TableCellFactoryError: ErrorType {
  case InvalidTableViewCellConformance(message: String)
  case UnregisteredTableView(message: String)
}

public class TableCellFactory {
  
  // MARK: - Initialization -
  
  public static let sharedInstance = TableCellFactory()
  private init() {}
  
  // MARK: - Dequeuing -
  
  /**
  Creates a cell from a given object if and only if the object conforms to the AVNICellObject
  protocol.
  
  This method signature matches the AVNITableViewModelDelegate method so that you can
  set this factory as the model's delegate:
  
  If you would like to customize the factory's output, implement the model's delegate method
  and call the factory method. Remember that if the factory doesn't know how to map
  the object to a cell it will return nil.
  
  - parameter tableViewModel: tableViewModel object
  - parameter tableView:      tableview
  - parameter indexPath:      location of the wanted cell in the table view
  - parameter object:         the object that will tell which cell type to use
  
  - throws: this method can throw error when the table view is not yet registered or if the involved
  table view cells are not `TableViewCell`
  
  - returns: A table view cell object
  */
  public func tableViewModel(
    tableViewModel: Model,
    cellForTableView tableView: UITableView,
    atIndexPath indexPath: NSIndexPath,
    withObject object: TableCellObject) throws -> TableViewCell {
      
      // Only AVNICellObject-conformant objects may pass.
      let cellClass: UITableViewCell.Type = object.tableCellClass(indexPath)
      return try self.cellWithClass(cellClass, tableView: tableView, object: object, indexPath: indexPath)
  }
  
  /**
   Description
   
   - parameter cellClass: cellClass description
   - parameter tableView: tableView description
   - parameter object:    object description
   - parameter indexPath: indexPath description
   
   - throws: `InvalidTableViewCellConformance` error if the table view dequeue a `UITableViewCell` which is not
   a `TableViewCell`
   
   - returns: a `TableViewCell`
   */
  public func cellWithClass(
    cellClass: UITableViewCell.Type,
    tableView: UITableView,
    object: TableCellObject,
    indexPath: NSIndexPath) throws -> TableViewCell {
      
      // Configure the dequeue identifier
      var identifier: String = NSStringFromClass(cellClass)
      if object.shouldAppendClassNameToReuseIdentifier() {
        identifier += String(object.dynamicType)
      }
      // Better improve this
      tableView.registerClass(cellClass, forCellReuseIdentifier: identifier)
      
      guard let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableViewCell else {
        throw TableCellFactoryError.InvalidTableViewCellConformance(
          message: "The returned tableview cell should be a subclass of `TableViewCell`"
        )
      }
      
      // Allow the cell to configure itself with the object's information.
      if cell.shouldUpdateCellWithObject(object, indexPath: indexPath) {
        cell.updateCellWithObject(object, indexPath: indexPath)
      }
      
      return cell
  }
  
  // MARK: - Registering/Unregistering -
  
  // MARK: Properties
  
  typealias ClassSet = Set<String>
  typealias ClassRegistrationDictionary = [UITableView: ClassSet]
  
  var observedTableViews: Set<UITableView> = Set<UITableView>()
  var classRegistrations: ClassRegistrationDictionary = ClassRegistrationDictionary()
  
  // MARK: Functions
  
  /**
  Register the table view and prepare the registered classes storage
  
  - parameter tableView: the tableview to register
  */
  public func registerTableView(tableView: UITableView) {
    // If it already exist, we have nothing to do here, we just return
    if self.observedTableViews.contains(tableView) {
      return
    }
    
    // Add the given table view to the set of observed table views
    self.observedTableViews.insert(tableView)
    // And initiate the set of classes
    self.classRegistrations[tableView] = ClassSet()
  }
  
  /**
   Unregister the table view and the registered classes associated to that table view
   
   - parameter tableView: the tableview to unregister
   */
  public func unregisterTableView(tableView: UITableView) {
    // Remove the value for the given tableview
    self.classRegistrations.removeValueForKey(tableView)
    // Remove the tableview from the set of observed table views
    self.observedTableViews.remove(tableView)
  }
  
}
