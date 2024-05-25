import 'package:freezed_annotation/freezed_annotation.dart';


part 'signup_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  SignUpRequestBody({
    required this.email,
    required this.password,
    required this.avatar,
    required this.name,
  });

  final String name;
  final String email;
  final String password;
  final String avatar;

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}