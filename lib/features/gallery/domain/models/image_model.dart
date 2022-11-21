

class ImageModel {
  final String id;
  final String imageLarge;
  final String imageThumbnail;
  final String userName;
  final int likes;
  final String firstName;

  ImageModel({
    required this.id,
    required this.imageLarge,
    required this.imageThumbnail,
    this.userName = "Unknown",
    this.firstName = "Unknown",
    this.likes = 0
  });

}