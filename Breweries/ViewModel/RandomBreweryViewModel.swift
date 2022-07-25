//
//  RandomBreweryViewModel.swift
//  Breweries
//
//  Created by admin on 7/25/22.
//

import Foundation

class RandomBreweryViewModel: ObservableObject {
    @Published var brewery: [Brewery] = []
    @Published var isError = false
    
    func getData(){
        
        guard let apiUrl = URL(string: "https://api.openbrewerydb.org/breweries/random") else {
            //handle api error
            print("url error")
            isError = true
            return
        }
        let task = URLSession.shared.dataTask(with: apiUrl){ [weak self] data, response, error in
            guard let data = data else {
                //handle data error
                print("data error")
                self?.isError = true
                return
            }
            do{
                let result = try JSONDecoder().decode([Brewery].self, from: data)
                //sort by name
                DispatchQueue.main.async {
                    self?.brewery = result
                }
                
            }catch{
                //handle decoding error
                print("decoding error")
                print(error)
                self?.isError = true
                return
                
            }
        }
        task.resume()
    }
}
