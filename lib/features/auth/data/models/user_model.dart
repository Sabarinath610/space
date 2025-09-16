import '../../domain/entities/user.dart' as domain;

class UserModel {
  final String id; final String name; final String email;
  UserModel({required this.id, required this.name, required this.email});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(id: json['id']?.toString() ?? '0', name: json['name'] ?? '', email: json['email'] ?? '');
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
  domain.User toEntity() => domain.User(id: id, name: name, email: email);
}