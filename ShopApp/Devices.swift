import Foundation

class Products {
    var products = [Product]()
    
    init() {
        let product1 = Product(name: "IPhone 14 Pro 256GB", price: 1600, image: #imageLiteral(resourceName: "Iphone14pro"))
        let product2 = Product(name: "IPhone 14 256GB", price: 990, image: #imageLiteral(resourceName: "iphone14"))
        let product3 = Product(name: "Apple Watch Ultra", price: 800, image: #imageLiteral(resourceName: "appleWUltra"))
        let product4 = Product(name: "Apple Watch 8", price: 350, image: #imageLiteral(resourceName: "appleW8"))
        let product5 = Product(name: "Apple Watch SE", price: 270, image: #imageLiteral(resourceName: "appleWSE"))
        let product6 = Product(name: "MacBook Pro 16", price: 2600, image: #imageLiteral(resourceName: "mbPro16"))
        let product7 = Product(name: "MacBook Pro 14", price: 2200, image: #imageLiteral(resourceName: "mbPro14"))
        let product8 = Product(name: "MacBook Pro", price: 1600, image: #imageLiteral(resourceName: "mbPro13"))
        products = [product1, product2, product3, product4, product5, product6, product7, product8]
    }
    
}
