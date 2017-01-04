//
//  MainViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import ReactiveCocoa

public enum TabViewItem: Int {
    case First = 0
    case Second
    case Third
    case Four
}

public final class MainViewModel {

    public let selectedTab: AnyProperty<TabViewItem>

    private let _selectedTab = MutableProperty(TabViewItem.First)

    private let _donationsRepository: DonationRepositoryType
    
    private let _userRepository: UserRepositoryType
    
    public init(donationsRepository: DonationRepositoryType, userRepository: UserRepositoryType) {
        selectedTab = AnyProperty(_selectedTab)
        
        _donationsRepository = donationsRepository
        _userRepository = userRepository
    }

    public func selectTab(at index: Int) {
        guard let selectedTab = TabViewItem(rawValue: index) where selectedTab != _selectedTab.value else { return }

        _selectedTab.value = selectedTab
    }
    
    public func createDonationPickerViewModel() -> DonationPickerViewModel {
        return DonationPickerViewModel(donationRepository: _donationsRepository)
    }
    
    public func createActiveDonationsViewModel() -> ActiveDonationsViewModel {
        return ActiveDonationsViewModel(donationRepository: _donationsRepository)
    }
    
    public func createDonationsRecordViewModel() -> DonationsRecordsViewModel {
        return DonationsRecordsViewModel(donationRepository: _donationsRepository)
    }
    
    public func createProfileViewModel() -> LoginViewModel {
        return LoginViewModel(userRepository: _userRepository)
    }
}
