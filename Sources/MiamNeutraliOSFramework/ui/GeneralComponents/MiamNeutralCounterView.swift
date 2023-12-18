//
//  MiamNeutralCounterView.swift
//  
//
//  Created by didi on 13/10/2023.
//

import SwiftUI
import MiamIOSFramework

@available(iOS 14, *)
public struct MiamNeutralCounterView: View {
    @State public var count: Int
    public var onCounterChanged: (Int) -> Void
    public var lightMode: Bool
    public var maxValue: Int?
    public var minValue: Int?
    public var isLoading: Bool
    public var isDisable: Bool

    public init(
        count: Int,
        lightMode: Bool = false,
        onCounterChanged: @escaping (Int) -> Void,
        isLoading: Bool = false,
        isDisable: Bool = false,
        minValue: Int? = nil,
        maxValue: Int? = nil
    ) {
        self.lightMode = lightMode
        self.onCounterChanged = onCounterChanged
        self.minValue = minValue ?? nil
        self.maxValue = maxValue ?? nil
        self.isLoading = isLoading
        self.isDisable = isDisable
        self._count = State(initialValue: count)
    }

    private func newValueBounded(newValue: Int) -> Bool {
        guard let minValue, let maxValue else {
            return true
        }
        return newValue >= minValue && newValue <= maxValue
    }

    private func increase() {
        if !newValueBounded(newValue: count + 1) { return }
        count += 1
        onCounterChanged(count)
    }

    private  func decrease() {
        if !newValueBounded(newValue: count - 1) { return }
        count -= 1
        onCounterChanged(count)
    }

    public var body: some View {
            HStack {
                Button {
                    decrease()
                } label: {
                    Image.mealzIcon(icon: .minus)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.miamColor(.white))
                }
                .padding(.leading, Dimension.sharedInstance.lPadding)
                .frame(width: 20.0, height: 20.0, alignment: .leading)
                .disabled(self.isDisable)

                Spacer()
                if isLoading {
                    ProgressLoader(color: Color.miamColor(.white))
                        .scaleEffect(0.5)
                } else {
                    Text(
                        "\(count)" +
                        " \( lightMode ? "" : Localization.counter.persons.localised)"
                    )
                        .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.titleSmallStyle)
                        .foregroundColor(Color.miamColor(.white))
                    Spacer()
                }
                Button {
                   increase()
                } label: {
                    Image.mealzIcon(icon: .plus)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.miamColor(.white))
                }
                .padding(.trailing, Dimension.sharedInstance.lPadding)
                .frame(width: 20.0, height: 20.0, alignment: .trailing)
                .disabled(self.isDisable)

            }.frame(width: lightMode ? 90 : 130.0, height: 40.0, alignment: .center)
                .background(Color.miamColor(.primaryText))
                .cornerRadius(25.0).padding(.trailing, Dimension.sharedInstance.mPadding)
    }
}

@available(iOS 14, *)
struct MiamNeutralCounterView_Previews: PreviewProvider {
    static var previews: some View {
        MiamNeutralCounterView(
            count: 12,
            onCounterChanged: { _ in  print("ok")}
        )
    }
}
