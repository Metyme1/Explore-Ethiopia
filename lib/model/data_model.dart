class DataModel{
  String name;
  String img;
  int price;
  int comment;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.comment,
    required this.description,
    required this.location,
    required this.stars,
});
  factory DataModel.fromjson(Map<String, dynamic>json){
    return DataModel(name: json["name"],
    img: json["img"],
  price: json["price"],
  comment: json["comment"],
  description: json["description"],
  location: json["location"],
  stars: json["stars"]
    );
  }
}