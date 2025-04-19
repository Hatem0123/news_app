class ArticleModel {
  final String image;
  late final String title;
  final String description;
  Source? sorceto;

  ArticleModel(
      { required this.image,  required this.title, required this.description,  this.sorceto});


  factory ArticleModel.FromJson(json){
    return ArticleModel(image: json['urlToImage'], title: json['title'], description: json['description']);
  }

}

class Source{
  final String? id;
  final String? name;

  Source({this.id,this.name});


}
