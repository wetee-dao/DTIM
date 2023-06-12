import 'user.dart';

class MentionModel {
  User user;
  String? emoji;
  String message;

  MentionModel({required this.user, this.emoji, required this.message});
}
