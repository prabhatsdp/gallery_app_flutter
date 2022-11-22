

class ImageModel {
  final String id;
  final String imageLarge;
  final String imageThumbnail;
  final String userName;
  final int likes;
  final String firstName;
  final String color;

  ImageModel({
    required this.id,
    required this.imageLarge,
    required this.imageThumbnail,
    this.userName = "Unknown",
    this.firstName = "Unknown",
    this.likes = 0,
    this.color = "#AAAAAA"
  });

  int hexColor() {
    final buffer = StringBuffer();
    buffer.write("ff");
    buffer.write(color.replaceFirst("#", ""));
    return int.parse(buffer.toString(), radix: 16);
  }

}