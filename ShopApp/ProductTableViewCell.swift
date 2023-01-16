import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    let productNameLabel = UILabel()
    let priceLabel = UILabel()
    let imageViewProduct = UIImageView()
    let cartIcon = UIButton(type: .system)
    let productType = UILabel()
    let favorite = UIButton(type: .system)
    let СustomerReviews = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imageViewProduct)
        imageViewProduct.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.left.equalTo(15)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
        }
        
        imageViewProduct.contentMode = .scaleAspectFill
        imageViewProduct.clipsToBounds = true
        
        self.contentView.addSubview(productNameLabel)
        productNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageViewProduct.snp.right).offset(10)
            make.top.equalTo(10)
        }
        
        self.contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(productNameLabel.snp.left)
            make.top.equalTo(productNameLabel.snp.bottom).offset(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(0)
        }
        
        
        self.contentView.addSubview(cartIcon)
        cartIcon.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        cartIcon.addTarget(self, action: #selector(cartIconPressed), for: .touchUpInside)
        cartIcon.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        cartIcon.snp.makeConstraints { make in
            make.trailing.equalTo(priceLabel.snp.trailing).offset(-20)
            make.bottom.equalTo(-26)
        }
        
        self.contentView.addSubview(productType)
        productType.font = UIFont(name: "Helvetica", size: 10)
        productType.snp.makeConstraints { (make) in
            make.left.equalTo(imageViewProduct.snp.right).offset(10)
            make.top.equalTo(40)
        }
        
        self.contentView.addSubview(favorite)
        favorite.setImage(UIImage(systemName: "heart"), for: .normal)
        favorite.addTarget(self, action: #selector(favoritePressed), for: .touchUpInside)
        favorite.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        favorite.snp.makeConstraints { make in
            make.trailing.equalTo(priceLabel.snp.trailing).offset(-20)
            make.top.equalTo(15)
        }
        self.contentView.addSubview(СustomerReviews)
        СustomerReviews.font = UIFont(name: "Helvetica", size: 10)
        СustomerReviews.snp.makeConstraints { make in
            make.trailing.equalTo(priceLabel.snp.trailing).offset(-120)
            make.bottom.equalTo(-33)
        }
    }
    
    @objc func cartIconPressed() {
        cartIcon.setImage(UIImage(systemName: "cart.fill.badge.plus"), for: .normal)
    }
    
    @objc func favoritePressed() {
        favorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        productNameLabel.text = product.name
        priceLabel.text = "\(product.price) $"
        imageViewProduct.image = product.image
        productType.text = product.deviceType
        СustomerReviews.text = product.review
    }
}

class Product {
    let name: String
    let price: Int
    let image: UIImage?
    let deviceType : String?
    let review: String?
    
    init(name: String, price: Int, image: UIImage?, deviceType: String?, review: String?) {
        self.name = name
        self.price = price
        self.image = image
        self.deviceType = deviceType
        self.review = review
    }
}

