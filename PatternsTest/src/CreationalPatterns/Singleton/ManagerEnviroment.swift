//
//  ManagerEnviroment.swift
//  PatternsTest
//
//  Created by German Rincon Urrego on 17/04/21.
//

import Foundation

class ManagerEnviroment {
    
    static let shared = ManagerEnviroment()
    
    private var appEnviroment: EnvirommentData
    
    private init() {
        self.appEnviroment = AppEnviromentFactory(env: .dev).create()
    }
    
    func changeEnviroment(env: Enviromment){
        self.appEnviroment = AppEnviromentFactory(env: env).create()
    }
    
    func getEnviromment() -> EnvirommentData {
        return appEnviroment
    }
}
