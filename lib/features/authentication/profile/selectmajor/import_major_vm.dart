
import 'package:job_search/data/model/major.dart';

import '../../../../common/base_view_model.dart';

class ImportNetworkVM extends BaseViewModel {
  List<Major>? networks = <Major>[];
  Major? currentNetwork;

  initData(List<Major> networks, Major? current) {
    this.networks = List.from(networks);
    currentNetwork = current;
  }

  void updateDataSelect(Major item) {
    currentNetwork = item;
    var list = networks ?? [];
    int index = list.indexWhere((element) => element.id == item.id);
    for (var element in list) {
      if (element.isSelected == true) {
        element.isSelected = false;
      }
    }
    list[index].isSelected = true;
    notifyListeners();
  }
}