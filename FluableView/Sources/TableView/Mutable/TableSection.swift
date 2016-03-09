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
//  FluableView : TableSection.swift
//

import Foundation

public struct TableSection<Element>: SectionType {
  public var elements: [Element] {
    return self.innerStorage
  }
  
  public init(arrayLiteral elements: Element...) {
    self.innerStorage = elements
  }
  
  // Readwrite storage
  private var innerStorage: [Element]
}
