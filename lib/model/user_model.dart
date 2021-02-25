
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String address;
  final String groupId;
   final String userRole;
   
  UserModel({
     this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.address,
    this.groupId,
    this.userRole,
  });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      firstName: doc['first_name'],
      lastName: doc['last_name'],
      phone: doc['phone'],
      email: doc['email'],
      address: doc['address'],
      groupId: doc['user_group_id'],
      userRole: doc['user_role'],
    );
  }

  UserModel copyWith({
    String id,
    String firstName,
    String lastName,
    String phone,
    String email,
    String address,
    String groupId,
    String userRole,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      groupId: groupId ?? this.groupId,
      userRole: userRole ?? this.userRole,
    
    );
  }
}
