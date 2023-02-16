import 'package:scoped_model/scoped_model.dart';

class HomeModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
