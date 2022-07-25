//
//  ContentView.swift
//  Breweries
//
//  Created by admin on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breweries = BreweryViewModel()
    @State var breweriesSelected = true
    let name: LocalizedStringKey = "Name"
    let city: LocalizedStringKey = "City"
    let state: LocalizedStringKey = "State"
    let street: LocalizedStringKey = "Street"
    let breweriesText: LocalizedStringKey = "Breweries"
    let randomB: LocalizedStringKey = "RandomB"
    let dataError: LocalizedStringKey = "LoadingError"
    
    var body: some View {
        
        VStack{
            HStack{
                Text(breweriesText)
                    .frame(width: 190, height: 40)
                    .border(.black)
                    .onTapGesture {
                        breweriesSelected = true
                    }
                Text(randomB)
                    .frame(width: 190, height: 40)
                    .border(.black)
                    .onTapGesture {
                        breweriesSelected = false
                    }

            }
            if breweries.isError && breweriesSelected {
                Text(dataError)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.top, 200)
            }
            if breweriesSelected {
                List{
                    ForEach(breweries.breweries, id: \.self){ brewery in
                        //don't display, if no city data
                        if let bCity = brewery.city, let bStreet = brewery.street, let bState = brewery.state {
                            //check for city string to be empty
                            if !bCity.isEmpty{
                                VStack(alignment: .leading){
                                    Text(name).bold() + Text(brewery.name)
                                    Text(street).bold() + Text(bStreet)
                                    Text(city).bold() + Text(bCity)
                                    Text(state).bold() + Text(bState)
                                }
                            }
                            
                        }
                    }
                }
            .onAppear{
                breweries.getData()
            }
            }else {
                RandomBreweryView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
