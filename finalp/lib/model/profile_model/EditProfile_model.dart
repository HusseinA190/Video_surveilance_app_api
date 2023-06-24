
class EditProfileModel {
  String? Name;
  String? Email;

  EditProfileModel(
      {
        this.Name,
        this.Email,

      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> EditProfileModelData = new Map<String, dynamic>();
    EditProfileModelData['name'] = this.Name;
    EditProfileModelData['email'] = this.Email;


    return EditProfileModelData;
  }
}