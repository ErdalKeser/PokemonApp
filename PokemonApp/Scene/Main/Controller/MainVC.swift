//
//  ViewController.swift
//  PokemonApp
//
//  Created by Erdal Keser on 21.03.2023.
//

import UIKit

protocol PokemonMainVCInterface: AnyObject {
    func configureTableView()
    func reloadTableView()
    func getPokemonListSuccess()
}

final class MainVC: UIViewController {
    
    private let viewModel = MainViewModel()
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var selectedIndex = IndexPath(row: -1, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "POKEMON"
        
        viewModel.delegate = self
        viewModel.viewDidLoad()
        viewModel.getPokemonList()
    }
    
}

extension MainVC: PokemonMainVCInterface {
    
    func getPokemonListSuccess() {
        for i in viewModel.pokemons {
            guard let url = i.url else { return }
            self.viewModel.getDetail(url: url)
        }
    }
    
    func configureTableView() {
        
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.register(UINib(nibName: "PokemonListTableViewCell", bundle: nil), forCellReuseIdentifier: "pokemonCell")
    }
    
    func reloadTableView() {
        pokemonTableView.reloadOnMainThread()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indeks = sender as? Int
        let toGoVC = segue.destination as! DetailVC
        guard let indeks = indeks else {return}
        toGoVC.imageUrls = viewModel.imageUrls[indeks]
        toGoVC.name = viewModel.names[indeks]
        toGoVC.abilities1 = viewModel.abilities1[indeks]
        
    }
    
}
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imageUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonListTableViewCell
        
      
                 if selectedIndex == indexPath { cell.backgroundColor = UIColor.black }

        cell.setCell(image: viewModel.imageUrls[indexPath.row])
        cell.setCell(name: viewModel.names[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexesToRedraw = [indexPath]
               selectedIndex = indexPath
               tableView.reloadRows(at: indexesToRedraw, with: .fade)

        performSegue(withIdentifier: "segue", sender: indexPath.row)
    }
    
}

