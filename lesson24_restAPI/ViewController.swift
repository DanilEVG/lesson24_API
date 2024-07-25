//
//  ViewController.swift
//  lesson24_restAPI
//
//  Created by Даниил Евгеньевич on 12.07.2024.
//
/*
 
1) в collectionView отобразить список persons
2) добавить экран добавления нового персона с тремя textField
3) удалить последнего персона
 
 */



import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var countPersons = 0
    var allPer: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //getAllPersons()
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllPersons()
    }

    @IBAction func addPersonTap(_ sender: Any) {
        guard let addPersonVC = self.storyboard?.instantiateViewController(withIdentifier: "AddPersonVC") as?  AddPersonVC else {return}
        self.navigationController?.pushViewController(addPersonVC, animated: true)
    }
    
    
    @IBAction func deletePersonTap(_ sender: UIButton) {
        let apiService = ApiService()
        Task {
            try await apiService.deletePerson()
            getAllPersons()
        }
    }

    
    func getAllPersons() {
        Task {
            
            let apiService = ApiService()
            let allPersons = try await apiService.getAllPerson()
            allPersons.forEach {
                print("id: \($0.id), firstName: \($0.firstName), lastName: \($0.lastName), email: \($0.email)")
            }
            countPersons = allPersons.count
            allPer = allPersons
            
            collectionView.reloadData()
        }
    }
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countPersons
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell,
              let allPer else {
            return UICollectionViewCell()
        }
        
        cell.configure(id: "id: \(allPer[indexPath.item].id)",
                       firstName: "first name:  \(allPer[indexPath.item].firstName)",
                       lastName: "last name:    \(allPer[indexPath.item].lastName)",
                       email: "email:   \(allPer[indexPath.item].email)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.width) - 20
        return CGSize(width: side, height: side / 3)
    }
    
    
    
}

