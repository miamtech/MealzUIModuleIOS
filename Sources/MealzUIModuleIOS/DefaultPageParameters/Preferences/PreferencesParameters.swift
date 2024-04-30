//
//  PreferencesParameters.swift
//  
//
//  Created by didi on 05/10/2023.
//

import MealzIOSFramework

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
    public var actions: PreferencesActions
    
    public var guestSection: TypeSafePreferencesGuest
    public var dietSection: TypeSafePreferencesDiet
    public var ingredientsSection: TypeSafePreferencesIngredients
    public var equipmentSection: TypeSafePreferencesEquipment
    public var footer: TypeSafePreferencesFooter
    
    public init(
        actions: PreferencesActions,
        viewOptions: PreferencesViewOptions = PreferencesViewOptions()
    ) {
        self.actions = actions
        self.guestSection = viewOptions.guestSection
        self.dietSection = viewOptions.dietSection
        self.ingredientsSection = viewOptions.ingredientsSection
        self.equipmentSection = viewOptions.equipmentSection
        self.footer = viewOptions.footer
    }
}
