class ContactModel {
  int id;
  String name;
  String mobile;
  String email;
  String company;
  String designation;
  String address;
  String website;
  bool favorite;
  String image;

  ContactModel({
      this.id=-1,
      required this.name,
      required this.mobile,
      this.email='',
      this.company='',
      this.designation='',
      this.address='',
      this.website='',
      this.favorite=false,
      this.image = 'images/person.jpeg'
  });

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, mobile: $mobile, email: $email, company: $company, designation: $designation, address: $address, website: $website, favorite: $favorite, image: $image}';
  }
}
