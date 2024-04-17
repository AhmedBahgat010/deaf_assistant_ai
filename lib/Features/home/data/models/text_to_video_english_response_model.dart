class TextToVideoResponseModel {
  dynamic data;

  TextToVideoResponseModel({
    this.data,
  });

  factory TextToVideoResponseModel.fromJson(Map<String, dynamic> json) {
    return TextToVideoResponseModel(
      data: json['video'],
    );
  }
}
