//
//  MainViewController.swift
//  ParsingJSON
//
//  Created by Vasiliy on 09.08.2022.
//

import UIKit

enum Link: String {
    case timerURL = "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func JSONButtonPressed(_ sender: Any) {
        fetchTimer()
    }
    
    
    //MARK: - Networking
    private func fetchTimer() {
        guard let url = URL(string: Link.timerURL.rawValue) else {return}
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let timer = try JSONDecoder().decode(Timer.self, from: data)
                print(timer)
                self?.successAlert()
            } catch let error {
                print(error.localizedDescription)
                self?.faildAlert()
            }
        }.resume()
        
    }
    
    //MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "See results in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func faildAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "See error in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
}

