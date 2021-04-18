//
//  AppEnviromentFactory.swift
//  PatternsTest
//
//  Created by German Rincon Urrego on 17/04/21.
//

import Foundation

enum Enviromment {
    case prod
    case qa
    case dev
}

class AppEnviromentFactory: EnvirommentFactory {
    
    var env: Enviromment
    
    init(env: Enviromment) {
        self.env = env
    }
    
    func create() -> EnvirommentData {
        switch env {
        case .prod:
            return ProdEnviromentFactory().create()
        case .qa:
            return QAEnviromentFactory().create()
        case .dev:
            return DevEnvirommentFactory().create()
        }
    }
}
