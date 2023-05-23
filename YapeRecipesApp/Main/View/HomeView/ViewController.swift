//
//  ViewController.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 16/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ViewModelListRecipes()
    private var recipe : Recipe?
    private var listRecipe: [Recipe]?
    var results : [Codable]!
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        title = "Lista de recetas"
        navigationController?.navigationBar.barTintColor = .blue
        configureTableView()
    }
    
    private func configureView(){
        activity.isHidden = false
        activity.startAnimating()
        getData()
    }
    
    func getData() {
        viewModel.getRecipes { result in
            switch result {
            case .success(let recipes):
                print(recipes)
                self.listRecipe = recipes
                self.results = self.listRecipe
                print("results", self.results)
                self.bindViewModel()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func bindViewModel(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activity.stopAnimating()
            self.activity.isHidden = true
        }
    }
    
    private func configureTableView(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeTableViewCell")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ?  results?.count ?? 0 : listRecipe?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self)) as! RecipeTableViewCell
        let object = isSearching ? results[indexPath.row] : listRecipe![indexPath.row]
        self.recipe = object as? Recipe
        cell.nameRecipe.text = recipe?.name
        cell.imageRecipe.imageFromServerURL(urlString: (recipe?.image!)!, placeholderImage: UIImage(named: "default_image")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetailRecipeVC", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailRecipeVC") as! DetailRecipeVC
        let object = listRecipe![indexPath.row]
        nextViewController.recipe = object
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true)
    }
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            results = listRecipe
        } else {
            isSearching = true
            results = listRecipe?.filter({text in
                return text.name!.lowercased().contains(searchText.lowercased())
            })
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        results = listRecipe
        tableView.reloadData()
    }
}
