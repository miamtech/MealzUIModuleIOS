//
//  PreferencesParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MiamIOSFramework

/**
 A class implemening the necessary parameters for the Preferences Page.
 
 Mandatory Parameters:
 - onClosed: () -> Void: A closure used to close the entire Preferences page
 - onGoToSearch: () -> Void: A closure that will open the PreferencesView page where the user can search for items to add to the ingredients they wish to avoid
 
 Optional Parameters:
 - viewOptions: ``PreferencesViewOptions`` -> An optional object where you can override the default Miam views for the component.
 
 */
@available(iOS 14, *)
public class PreferencesParameters: PreferencesParametersProtocol {
    public var onClosed: () -> Void
    public var onGoToSearch: () -> Void
    
    public var guestSection: TypeSafePreferencesGuest
    public var dietSection: TypeSafePreferencesDiet
    public var ingredientsSection: TypeSafePreferencesIngredients
    public var equipmentSection: TypeSafePreferencesEquipment
    public var footer: TypeSafePreferencesFooter
    public var background: TypeSafeBackground
    public var empty: TypeSafeEmpty
    public var loading: TypeSafeLoading
    
    public init(
        onClosed: @escaping () -> Void,
        onGoToSearch: @escaping () -> Void,
        viewOptions: PreferencesViewOptions = PreferencesViewOptions()
    ) {
        self.onClosed = onClosed
        self.onGoToSearch = onGoToSearch
        self.guestSection = viewOptions.guestSection
        self.dietSection = viewOptions.dietSection
        self.ingredientsSection = viewOptions.ingredientsSection
        self.equipmentSection = viewOptions.equipmentSection
        self.footer = viewOptions.footer
        self.background = viewOptions.background
        self.empty = viewOptions.empty
        self.loading = viewOptions.loading
    }
}
