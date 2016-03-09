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
//  FluableView : TableModel.swift
//

import Foundation

extension TableModel: ModelType {
  
  public func append(element: Element, toSection: Array<Section>.Index) -> NSIndexPath {
    assert(toSection >= 0 && toSection < self._storage.count)
    self._storage[toSection]._storage.append(element)
    return NSIndexPath(forRow: self._storage[toSection]._storage.count, inSection: toSection)
  }
  
  public func append(section: Section) -> NSIndexSet {
    self._storage.append(section)
    return NSIndexSet(index: self._storage.count)
  }
}
