import 'package:flutter/foundation.dart';

class MessageProvider extends ChangeNotifier {
  String? _messageForDetail; // ส่งจาก Home -> ให้ Detail แสดง
  String? _messageForHome;   // ส่งจาก Detail -> ให้ Home แสดง

  String? get messageForDetail => _messageForDetail;
  String? get messageForHome   => _messageForHome;

  void setMessageForDetail(String value) {
    _messageForDetail = value;
    notifyListeners();
  }

  void setMessageForHome(String value) {
    _messageForHome = value;
    notifyListeners();
  }

  void clear() {
    _messageForDetail = null;
    _messageForHome   = null;
    notifyListeners();
  }
}
