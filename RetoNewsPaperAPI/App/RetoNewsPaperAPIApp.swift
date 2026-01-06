//
//  RetoNewsPaperAPIApp.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import SwiftUI

@main
/// Punto de entrada de la aplicacion; carga la vista principal.
struct RetoNewsPaperAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleListView()
        }
    }
}
