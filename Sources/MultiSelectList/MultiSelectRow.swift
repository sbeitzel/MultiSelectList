//
//  MultiSelectRow.swift
//  
//
//  Created by Stephen Beitzel on 4/7/21.
//

import SwiftUI

struct MultiSelectRow<T>: View {
    let item: T
    let selected: Bool
    let action: () -> Void
    let itemString: (T) -> String

    var body: some View {
        HStack {
            icon
            Text(itemString(item))
            Spacer()
        }
        .background(background)
        .onTapGesture {
            action()
        }
    }

    var background: Color {
        if selected {
            return .accentColor
        } else {
            return .clear
        }
    }

    var icon: some View {
        ZStack {
            if selected {
                Image(systemName: "checkmark.circle")
            }
            EmptyView()
        }
        .frame(width: 30, height: 20, alignment: .center)
    }
}
