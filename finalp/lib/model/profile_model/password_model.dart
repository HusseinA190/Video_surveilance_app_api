
class PassModel {
  String? password;
  String? password2;

  PassModel(
      {
        this.password,
        this.password2,

      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> PassModelData = new Map<String, dynamic>();
    PassModelData['password'] = this.password;
    PassModelData['password2'] = this.password2;


    return PassModelData;
  }
}