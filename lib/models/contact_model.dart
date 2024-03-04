const String tableContact = 'tbl_contact';
const String tableContactColId = 'id';
const String tableContactColName = 'name';
const String tableContactColMobile = 'mobile';
const String tableContactColEmail = 'email';
const String tableContactColAddress = 'address';
const String tableContactColWebsite = 'website';
const String tableContactColImage = 'image';
const String tableContactColFavorite = 'favorite';
const String tableContactColCompany = 'company';
const String tableContactColDesignation = 'designation';

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



  ContactModel(
      {this.id = -1,
      required this.name,
      required this.mobile,
      this.email = '',
      this.company = '',
      this.designation = '',
      this.address = '',
      this.website = '',
      this.favorite = false,
      this.image = 'images/person.jpeg'});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tableContactColName: name,
      tableContactColMobile: mobile,
      tableContactColEmail: email,
      tableContactColCompany: company,
      tableContactColDesignation: designation,
      tableContactColAddress: address,
      tableContactColWebsite: website,
      tableContactColImage: image,
      tableContactColFavorite: favorite ? 1 : 0
    };

    if (id > 0) {
      map[tableContactColId] = id;
    }

    return map;
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
        id: map[tableContactColId],
        name: map[tableContactColName],
        mobile: map[tableContactColMobile],
        email: map[tableContactColEmail],
        address: map[tableContactColAddress],
        company: map[tableContactColCompany],
        designation: map[tableContactColDesignation],
        website: map[tableContactColWebsite],
        image: map[tableContactColImage],
        favorite: map[tableContactColFavorite] == 1 ? true : false,
      );

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, mobile: $mobile, email: $email, company: $company, designation: $designation, address: $address, website: $website, favorite: $favorite, image: $image}';
  }
}
