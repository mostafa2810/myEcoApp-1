


class CategoryModel {

  String name, image,des,link,video,city;
  CategoryModel({this.name,this.image,this.des,this.link,this.video,this.city});

  CategoryModel.fromJson(Map<dynamic,dynamic>map){

    if(map ==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    link=map["link"];
    des=map["details"];
    video=map["video"];
    city=map["city"];
  }

  toJson(){
    return {
      'name':name,
      'image':image,
      'link':link,
      'details':des,
      'video':video,
      'city':city
    };
  }
}
