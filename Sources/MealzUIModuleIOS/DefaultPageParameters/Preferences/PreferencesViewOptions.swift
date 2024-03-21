//
//  PreferencesViewOptions.swift
//  
//
//  Created by didi on 18/10/2023.
//

import MealzIOSFramework

/**
 The optional View parameters for Preferences. If nothing is passed in, the Miam Default will be used
 
 - guestSection:  An implementation of ``PreferencesGuestProtocol``
 - dietSection:  An implementation of ``PreferencesDietProtocol``
 - ingredientsSection:  An implementation of ``PreferencesIngredientsProtocol``
 - equipmentSection:  An implementation of ``PreferencesEquipmentProtocol``
 - footer:  An implementation of ``PreferencesFooterProtocol``

 
 */
@available(iOS 14, *)
public struct PreferencesViewOptions {
    public var guestSection: TypeSafePreferencesGuest
    public var dietSection: TypeSafePreferencesDiet
    public var ingredientsSection: TypeSafePreferencesIngredients
    public var equipmentSection: TypeSafePreferencesEquipment
    public var footer: TypeSafePreferencesFooter
    
    public init(
        guestSection: TypeSafePreferencesGuest = TypeSafePreferencesGuest(MealzPreferencesGuest()),
        dietSection: TypeSafePreferencesDiet = TypeSafePreferencesDiet(MealzPreferencesDiet()),
        ingredientsSection: TypeSafePreferencesIngredients = TypeSafePreferencesIngredients(MealzPreferencesIngredients()),
        equipmentSection: TypeSafePreferencesEquipment = TypeSafePreferencesEquipment(MealzPreferencesEquipment()),
        footer: TypeSafePreferencesFooter = TypeSafePreferencesFooter(MealzPreferencesFooter())
    ) {
        self.guestSection = guestSection
        self.dietSection = dietSection
        self.ingredientsSection = ingredientsSection
        self.equipmentSection = equipmentSection
        self.footer = footer
    }
}
