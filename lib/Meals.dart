List<Meals> mealsList = [
  new Meals(
      img: 'images/breakfast.jpg',
      name: 'Morning Breakfast',
      price: '\$15.00',
      rating: 4,
      tags: ['MILK', 'BREAD', 'JUICE']),
  new Meals(
      img: 'images/lunch.jpg',
      name: 'Lunch Food',
      price: '\$30.00',
      rating: 3,
      tags: ['RICE', 'BREAD', 'JUICE']),
];

class Meals {
  String img;
  String name;
  String price;
  List<String> tags;
  int rating;

  Meals({this.img, this.name, this.price, this.rating, this.tags});
}
