//
//  ToggleControl.swift
//  AAInfographicsDemo
//
//  Created by Kiro on 2025.
//  Copyright © 2025 An An. All rights reserved.
//

import SwiftUI

/// A reusable SwiftUI component that displays a toggle (switch) and a label in a vertical layout
@available(iOS 14.0, *)
struct ToggleControl: View {
    let title: String
    @Binding var isOn: Bool
    var fontSize: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 4) {
            // Toggle matching the original UIKit UISwitch style
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle())
                .accentColor(.red) // iOS 14 compatible - matching the original onTintColor
            
            // Label matching the original UIKit style
            Text(title)
                .font(.custom("EuphemiaUCAS", size: fontSize))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.7) // Allow more scaling if text is too long
        }
    }
}

// MARK: - Preview
#if DEBUG
@available(iOS 14.0, *)
struct ToggleControl_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 8) {
            ToggleControl(title: "xReversed", isOn: .constant(false))
            ToggleControl(title: "yReversed", isOn: .constant(true))
            ToggleControl(title: "xInverted", isOn: .constant(false))
            ToggleControl(title: "Polarization", isOn: .constant(false))
            ToggleControl(title: "DataShow", isOn: .constant(true))
            ToggleControl(title: "HideMarker", isOn: .constant(false))
        }
        .padding()
        .frame(height: 70)
        .background(Color(red: 0x22/255, green: 0x32/255, blue: 0x4c/255))
    }
}
#endif
