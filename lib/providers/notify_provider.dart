import 'package:flutter/cupertino.dart';
import 'package:insurapp/Models/noty_model.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notify = [];
  bool _isRead = false;

  List<NotificationModel> get notify => _notify;
  bool get isRead => _isRead;

  void addNotify(NotificationModel notiy) {
    _notify.add(notiy);
    notifyListeners();
  }

  void changeToRead(bool read) {
    _isRead = read;
    notifyListeners();
  }
}
