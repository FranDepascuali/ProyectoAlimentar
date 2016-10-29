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
}

public final class MainViewModel {

    public let selectedTab: AnyProperty<TabViewItem>

    private let _selectedTab = MutableProperty(TabViewItem.First)

    public init() {
        selectedTab = AnyProperty(_selectedTab)
    }

    public func selectTab(at index: Int) {
        guard let selectedTab = TabViewItem(rawValue: index) where selectedTab != _selectedTab.value else { return }

        _selectedTab.value = selectedTab
    }
}
