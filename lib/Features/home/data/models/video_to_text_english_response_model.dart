class VideoToTextEnglishResponseModel {
  dynamic data;

  VideoToTextEnglishResponseModel({
    this.data,
  });

  factory VideoToTextEnglishResponseModel.fromJson(Map<String, dynamic> json) {
    return VideoToTextEnglishResponseModel(
      data: json['text'],
    );
  }
}
