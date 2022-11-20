//
//  SectionInfoStub.swift
//  SOLIDArch_Tests
//
//  Created by Maxim Makankov on 20.11.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import SOLIDArch

class SectionInfoStub: SectionInfo {

    var stubbedNumberOfObjects: Int!
    var stubbedObjects: [ItemViewModel]?
    var stubbedName: String!
    var stubbedIndexTitle: String?

    private(set) var numberOfObjects: Int {
        get {
            stubbedNumberOfObjects
        }
        set {
            stubbedNumberOfObjects = newValue
        }
    }

    private(set) var objects: [ItemViewModel]? {
        get {
            stubbedObjects
        }
        set {
            stubbedObjects = newValue
        }
    }

    private(set) var name: String {
        get {
            stubbedName
        }
        set {
            stubbedName = newValue
        }
    }

    private(set) var indexTitle: String? {
        get {
            stubbedIndexTitle
        }
        set {
            stubbedIndexTitle = newValue
        }
    }
}
