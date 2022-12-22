class ImMessages {
  String message;
  String time;
  bool hostSource;
  String? srcImage;

  ImMessages({
    required this.message,
    required this.time,
    required this.hostSource,
    this.srcImage,
  });
}
