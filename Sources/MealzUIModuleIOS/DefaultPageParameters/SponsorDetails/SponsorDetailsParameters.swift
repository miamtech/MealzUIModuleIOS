//
//  SponsorDetailsParameters.swift
//  
//
//  Created by didi on 11/10/2023.
//

import MiamIOSFramework

/**
 A class implemening the necessary parameters for the Sponsor Details Page.
 
 Optional Parameters:
 - viewOptions: ``SponsorDetailsViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class SponsorDetailsParameters: BaseProtocols {
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        viewOptions: SponsorDetailsViewOptions = SponsorDetailsViewOptions()
    ) {
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
