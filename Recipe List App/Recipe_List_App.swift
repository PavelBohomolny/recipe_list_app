//
//  Recipe_List_AppApp.swift
//  Recipe List App
//
//  Created by Pavel Bohomolnyi on 21/06/2022.
//

import SwiftUI

@main
struct Recipe_List_App: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
