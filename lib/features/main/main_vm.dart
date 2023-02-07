import 'package:job_search/common/base_view_model.dart';

class MainViewModel extends BaseViewModel {
  int selectedTabIndex = 0;

  void onTabChanged(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  bool tabSelected(int index) {
    return selectedTabIndex == index;
  }
}
