//
//  BreweryViewModel.swift
//  Breweries
//
//  Created by admin on 7/25/22.
//

import Foundation

class BreweryViewModel: ObservableObject {
    @Published var breweries: [Brewery] = []
    @Published var isError = false
    
    func getData(){
        guard let apiUrl = URL(string: "https://mocki.io/v1/214223dc-c8f4-4a2f-9749-8ce2f355d04f") else {
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
                    self?.breweries = result.sorted { $0.name < $1.name}
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
