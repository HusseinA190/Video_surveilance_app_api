
class AlarmModel{
  String? alarmat;
  String? image_ur;
  int? id;
  int? cameria;


  // Named constructor | refactoring
  AlarmModel.fromJson({required Map<String,dynamic> data})
  {
    id = data['id'].toInt();
    cameria = data['cameria'].toInt();
    alarmat = data['alarmat'].toString();
    image_ur = data['image_ur'].toString();

  }
}
