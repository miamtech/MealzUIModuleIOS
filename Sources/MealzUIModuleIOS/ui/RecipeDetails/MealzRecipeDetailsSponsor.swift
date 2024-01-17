//
//  MealzRecipeDetailsSponsor.swift
//  
//
//  Created by didi on 10/10/2023.
//

import SwiftUI
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public struct MealzRecipeDetailsSponsor: RecipeDetailsSponsorProtocol {
    public init() {}
    public func content(
        sponsor: Sponsor,
        onSponsorTapped: @escaping () -> Void
    ) -> some View {
        HStack(spacing: 0.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(Localization.sponsorBanner.sponsorBannerSpeach.localised)
                    .miamFontStyle(style: MiamFontStyleProvider.sharedInstance.bodyStyle)
                Button {
                    onSponsorTapped()
                } label: {
                    Text(Localization.sponsorBanner.sponsorBannerMoreInfo.localised)
                }
            }
            Spacer(minLength: 16.0)
            if let sponsorAttributes = sponsor.attributes, let logoURL = URL(string: sponsorAttributes.logoUrl) {
                AsyncImage(url: logoURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 75.0, height: 48.0)
            }
        }
        .padding(.horizontal, Dimension.sharedInstance.mPadding)
        .padding(.vertical, Dimension.sharedInstance.lPadding)
    }
}
