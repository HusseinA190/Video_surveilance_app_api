
class ProfileModel{
  int? id;
  String? email;
  String? name;



  ProfileModel.fromJson({required Map<String,dynamic> data})
  {
    id = data['id'].toInt();
    email = data['email'].toString();
    name = data['name'].toString();

  }
}
