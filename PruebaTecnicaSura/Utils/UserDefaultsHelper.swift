//
//  UserDefaultsHelper.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 17/11/22.
//

import Foundation

enum UserDefaultKeys: String, CaseIterable {
   case email
}

/// Clase de utilidad para manejar los UserDefaults
final class UserDefaultsHelper {
    
    /// Función para almacenar/modificar un valor de UserDefaults
    /// - Parameters:
    ///   - value: Valor a agregar
    ///   - key: LLave del valor
    static func setData<T>(value: T, key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    /// Función para obtener el valor de un UserDefaults
    /// - Parameters:
    ///   - type: Tipo de variable
    ///   - forKey: Llave del valor
    /// - Returns: El valor de la llave obtenida
    static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }
    
    /// Función para eliminar un valor del UserDefaults
    /// - Parameter key: Llave del valor
    static func removeData(key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
}
