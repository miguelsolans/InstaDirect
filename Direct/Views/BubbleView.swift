//
//  BubbleView.swift
//  Direct
//
//  Created by Miguel Solans on 10/08/2020.
//  Copyright © 2020 Miguel Solans. All rights reserved.
//

import SwiftUI

struct BubbleView: View {
    var item: Item
    var viewer: User
    #if os(macOS)
    var outgoingBubbleColor = NSColor.systemBlue
    var incomingBubbleColor = NSColor.windowBackgroundColor
    var incomingLabelColor = NSColor.labelColor
    #else
    var outgoingBubbleColor = UIColor.systemBlue
    var incomingBubbleColor = UIColor.secondarySystemBackground
    var incomingLabelColor = UIColor.label
    #endif
    
    init(item: Item, viewer: User) {
        self.item = item
        self.viewer = viewer
    }
    
    
    
    var body: some View {
        
        HStack {
            if(viewer.pk == item.user_id) {
                Spacer()
            }
            
            
            Text(item.text ?? "Media Type")
                    .foregroundColor(Color(viewer.pk == item.user_id ? .white : incomingLabelColor))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color(viewer.pk == item.user_id ? outgoingBubbleColor : incomingBubbleColor))
                    .cornerRadius(16)
            
            if(viewer.pk != item.user_id) {
                Spacer()
            }
        }
    }
}
