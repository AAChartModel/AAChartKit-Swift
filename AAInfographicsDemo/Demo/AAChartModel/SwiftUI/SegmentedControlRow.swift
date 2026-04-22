//
//  SegmentedControlRow.swift
//  AAInfographicsDemo
//
//  Created by Kiro on 2025.
//  Copyright © 2025 An An. All rights reserved.
//

import SwiftUI

/// A reusable SwiftUI component that displays a label and a segmented control (Picker) in a vertical layout
@available(iOS 14.0, *)
struct SegmentedControlRow: View {
    let title: String
    let options: [String]
    @Binding var selection: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Label matching the original UIKit style
            Text(title)
                .font(.custom("EuphemiaUCAS", size: 12))
                .foregroundColor(.gray)
            
            // Segmented control using Picker with segmented style
            Picker("", selection: $selection) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index])
                        .tag(index)
                }
            }
            .pickerStyle(.segmented)
            .accentColor(.red) // iOS 14 compatible - matching the original tint color
        }
    }
}

// MARK: - Preview
#if DEBUG
@available(iOS 14.0, *)
struct SegmentedControlRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            SegmentedControlRow(
                title: "Stacking Type Selection",
                options: ["No stacking", "Normal stacking", "Percent stacking"],
                selection: .constant(0)
            )
            
            SegmentedControlRow(
                title: "Marker Symbols Type Selection",
                options: ["◉ ◉ ◉", "■ ■ ■", "◆ ◆ ◆", "▲ ▲ ▲", "▼ ▼ ▼"],
                selection: .constant(0)
            )
        }
        .padding()
        .background(Color(red: 0x22/255, green: 0x32/255, blue: 0x4c/255))
    }
}
#endif
