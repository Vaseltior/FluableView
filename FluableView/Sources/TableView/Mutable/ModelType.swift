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
//  FluableView : ModelType.swift
//

import Foundation

/**
 Conforming types must represent a two-level nested hierarchy of elements.
 */
public protocol ModelType: ArrayLiteralConvertible {
  typealias Section: SectionType
  
  var sections: [Section] { get }
  
  mutating func append(element: Section.Element, toSection: Array<Section>.Index) -> NSIndexPath
  mutating func append(section: Section) -> NSIndexSet
}

// For-free APIs thanks for protocol extensions
extension ModelType {
  mutating public func append(element: Section.Element) -> NSIndexPath {
    if self.sections.count == 0 {
      self.append([])
    }
    return self.append(element, toSection: self.sections.count - 1)
  }
}
