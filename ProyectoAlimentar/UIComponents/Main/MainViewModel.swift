//
//  MainViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import ReactiveSwift

public enum TabViewItem: Int {
    case first = 0
    case second
    case third
    case four
}

public final class MainViewModel {

    public let selectedTab: Property<TabViewItem>

    fileprivate let _selectedTab = MutableProperty(TabViewItem.first)

    fileprivate let _donationsRepository: DonationRepositoryType
    
    fileprivate let _userRepository: UserRepositoryType
    
    public init(donationsRepository: DonationRepositoryType, userRepository: UserRepositoryType) {
        selectedTab = Property(_selectedTab)
        
        _donationsRepository = donationsRepository
        _userRepository = userRepository
    }

    public func selectTab(at index: Int) {
        guard let selectedTab = TabViewItem(rawValue: index), selectedTab != _selectedTab.value else { return }

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
