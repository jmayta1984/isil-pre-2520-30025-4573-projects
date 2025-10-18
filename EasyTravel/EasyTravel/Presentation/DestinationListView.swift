//
//  DestinationListView.swift
//  EasyTravel
//
//  Created by Alumno on 17/10/25.
//

import SwiftUI

struct DestinationListView: View {
    @StateObject var viewModel = DestinationListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.destinations) { destination in
                Text(destination.title)
            }
        }
    }
}


#Preview {
    DestinationListView()
}
