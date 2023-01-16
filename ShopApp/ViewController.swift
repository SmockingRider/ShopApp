import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    class Products {
        var products = [Product]()

        init() {
            products = createProducts()
        }

        func createProducts() -> [Product] {
            let data = [("IPhone 14 Pro 256GB", 1600, #imageLiteral(resourceName: "Iphone14pro"), "Смартфон", "(1000 отзывов)"),
                        ("IPhone 14 256GB", 990, #imageLiteral(resourceName: "iphone14"), "Смартфон", "(500 отзывов)"),
                        ("Apple Watch Ultra", 800, #imageLiteral(resourceName: "appleWUltra"), "Часы", "(283 отзывов)"),
                        ("Apple Watch 8", 350, #imageLiteral(resourceName: "appleW8"), "Часы", "(233 отзывов)"),
                        ("Apple Watch SE", 270, #imageLiteral(resourceName: "appleWSE"), "Часы", "(343 отзывов)"),
                        ("MacBook Pro 16", 2600, #imageLiteral(resourceName: "mbPro16"), "Ноутбук", "(1500 отзывов)"),
                        ("MacBook Pro 14", 2200, #imageLiteral(resourceName: "mbPro14"), "Ноутбук", "(1425 отзывов)"),
                        ("MacBook Pro 13", 1600, #imageLiteral(resourceName: "mbPro13"), "Ноутбук", "(2334 отзывов)"),
                        ("MacBook Air M2", 1199, #imageLiteral(resourceName: "mbair.png"), "Ноутбук", "(992 отзывов)"),
                        ("AirPods Max", 450, #imageLiteral(resourceName: "airpodsMax"), "Наушники", "(696 отзывов)"),
                        ("Airpods Pro 2 Gen", 300, #imageLiteral(resourceName: "airpodspro2"), "Наушники", "(999 отзывов)")]
            var products = [Product]()
            for item in data {
                let product = Product(name: item.0, price: item.1, image: item.2, deviceType: item.3, review: item.4)
                products.append(product)
            }
            return products
        }
    }

    var tableView = UITableView()
    let product = Products()
    let buttonPanel = UIView()
    let buttonStackView = UIStackView()
    let ButtonHome = UIButton()
    let ButtonSearch = UIButton()
    let ButtonProfile = UIButton()
    let ButtonMenu = UIButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.top.equalTo(60)
            make.bottom.equalTo(-70)
        }
        
        let topMarginView = UIView()
        topMarginView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.view.addSubview(topMarginView)
        topMarginView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(60)
        }
        
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(70)
        }
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        buttonStackView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        
        buttonStackView.addArrangedSubview(ButtonHome)
        ButtonHome.setImage(UIImage(systemName: "house"), for: .normal)
        ButtonHome.transform = CGAffineTransform(scaleX: 2.3, y: 2.3)
        ButtonHome.snp.makeConstraints { make in
            make.left.equalTo(30)
        }
        
        buttonStackView.addArrangedSubview(ButtonSearch)
        ButtonSearch.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        ButtonSearch.transform = CGAffineTransform(scaleX: 2.3, y: 2.3)
        
        buttonStackView.addArrangedSubview(ButtonProfile)
        ButtonProfile.setImage(UIImage(systemName: "person"), for: .normal)
        ButtonProfile.transform = CGAffineTransform(scaleX: 2.3, y: 2.3)
        
        buttonStackView.addArrangedSubview(ButtonMenu)
        ButtonMenu.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        ButtonMenu.transform = CGAffineTransform(scaleX: 2.3, y: 2.3)
}

    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
    cell.product = product.products[indexPath.row]
    return cell
    }
}

