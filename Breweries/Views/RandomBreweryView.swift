//
//  RandomBreweryView.swift
//  Breweries
//
//  Created by admin on 7/25/22.
//

import SwiftUI

struct RandomBreweryView: View {
    @StateObject var brewery = RandomBreweryViewModel()
    let name: LocalizedStringKey = "Name"
    let city: LocalizedStringKey = "City"
    let state: LocalizedStringKey = "State"
    let street: LocalizedStringKey = "Street"
    let phone: LocalizedStringKey = "Phone"
    let dataError: LocalizedStringKey = "LoadingError"
    
    var body: some View {
        if brewery.isError {
            Text(dataError)
                .bold()
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding(.top, 200)
            Spacer()
        }else {
            List{
                ForEach(brewery.brewery, id:\.self){brewery in
                    VStack(alignment: .leading){
                        Text(name).bold() + Text(brewery.name)
                        Text(street).bold() + Text(brewery.street ?? "N/A")
                        Text(city).bold()  + Text((brewery.city ?? "N/A"))
                        Text(state).bold() + Text(brewery.state)
                        Text(phone).bold() + Text((brewery.phone ?? "N/A"))
                    }
                    .padding()
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                    .border(.black)
                }
            }
            .onAppear{
                brewery.getData()
            }
        }
    }
}

struct RandomBreweryView_Previews: PreviewProvider {
    static var previews: some View {
        RandomBreweryView()
    }
}
