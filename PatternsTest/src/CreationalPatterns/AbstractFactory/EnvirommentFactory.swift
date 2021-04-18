//
//  EnvirommentFactory.swift
//  PatternsTest
//
//  Created by German Rincon Urrego on 17/04/21.
//

import Foundation

protocol EnvirommentFactory{
    func create() -> EnvirommentData
}

//MARK: - Dev
class DevEnviromment : EnvirommentData{
    var url: URL { return URL(string: "https://dev.localhost/")! }
    var description: String { return "Developer"}
}

class DevEnvirommentFactory : EnvirommentFactory{
    func create() -> EnvirommentData {
        return DevEnviromment()
    }
}

//MARK: - QA
class QAEnviroment : EnvirommentData{
    var url: URL { return URL(string: "https://qa.localhost/")! }
    var description: String { return "QA"}
}

class QAEnviromentFactory : EnvirommentFactory{
    func create() -> EnvirommentData {
        return QAEnviroment()
    }
}

//MARK: - Prod
class ProdEnviroment : EnvirommentData{
    var url: URL { return URL(string: "https://live.localhost/")! }
    var description: String { return "Production"}
}

class ProdEnviromentFactory : EnvirommentFactory{
    func create() -> EnvirommentData {
        return ProdEnviroment()
    }
}
