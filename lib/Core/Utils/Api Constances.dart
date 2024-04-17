class APIConstances {
  String baseUrl = 'https://1f5e-35-224-211-241.ngrok-free.app/';
  static const String contentType = "application/json";
  static const String accept = "application/json";

  // receiveTimeout
  static const int receiveTimeout = 40000;

// connectTimeout
  static const int connectTimeout = 40000;

}

abstract class EndPoints {
  static const String videoToTextEnglish = "video_to_text_english";
  static const String videoToTextArabic  = "video_to_text_arabic";

  static const String textToVideoEnglish = "text_to_video_english";
  static const String textToVideoArabic  = "text_to_video_arabic";




}