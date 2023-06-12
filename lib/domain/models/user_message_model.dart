class UserMessageModel {
  String? message;
  String? imgSrc;
  String timeAgo;
  String? addUser;

  UserMessageModel({
    this.message,
    this.imgSrc,
    required this.timeAgo,
    this.addUser,
  });
}
