import '../models/product.dart';

// قائمة المنتجات المشتركة بين كل الشاشات (Home / Details / Cart)
// الكمية quantity هي نفسها كمية السلة: أي منتج كميته أكبر من 0 يظهر في السلة
final List<Product> allProducts = [
  Product(
    price: 1190.0,
    imagePath: 'images/image_1.png',
    name: 'Regular Fit Slogan',
    details:
        'Blue T Shirt . Good for All Men and Suits for All of Them. Blue T Shirt . Good for All Men and Suits for All of Them',
    quantity: 0,
    size: 'Size L',
    category: 'Tshirts',
  ),
  Product(
    price: 1100.0,
    imagePath: 'images/image_2.png',
    name: 'Regular Fit Polo',
    details:
        'Comfortable Sport Shoes . Good for Daily Walking and Running. Light weight and easy to wear all day long',
    quantity: 0,
    size: 'Size M',
    category: 'Shoes',
  ),
  Product(
    price: 1190.0,
    imagePath: 'images/image_1.png',
    name: 'Fit Polo T Shirt',
    details:
        'Blue T Shirt . Good for All Men and Suits for All of Them. Blue T Shirt . Good for All Men and Suits for All of Them',
    quantity: 0,
    size: 'Size M',
    category: 'Tshirts',
  ),
  Product(
    price: 1250.0,
    imagePath: 'images/image_2.png',
    name: 'Sport Running Shoes',
    details:
        'Comfortable Sport Shoes . Good for Daily Walking and Running. Light weight and easy to wear all day long',
    quantity: 0,
    size: 'Size 42',
    category: 'Shoes',
  ),
  Product(
    price: 850.0,
    imagePath: 'images/image_1.png',
    name: 'Classic Round Neck',
    details:
        'Blue T Shirt . Good for All Men and Suits for All of Them. Blue T Shirt . Good for All Men and Suits for All of Them',
    quantity: 0,
    size: 'Size XL',
    category: 'Tshirts',
  ),
  Product(
    price: 1350.0,
    imagePath: 'images/image_2.png',
    name: 'Urban Sneakers',
    details:
        'Comfortable Sport Shoes . Good for Daily Walking and Running. Light weight and easy to wear all day long',
    quantity: 0,
    size: 'Size 41',
    category: 'Shoes',
  ),
];
