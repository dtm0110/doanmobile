import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/common/view_state.dart';
import 'package:job_search/data/model/filter_arguments.dart';
import 'package:job_search/data/model/province.dart';
import 'package:job_search/data/repository/province_repository.dart';

class FilterVM extends BaseViewModel {
  final ProvinceRepository _provinceRepository;

  FilterArguments? filter;

  FilterVM(this._provinceRepository);

  List<Province> provinces = [];

  void initData(FilterArguments arguments) {
    filter = arguments;
    getListProvince();
  }

  Future<void> getListProvince() async {
    safeCallApi<ProvinceResponse>(_provinceRepository.provinceList(),
        onSuccess: (response) {
      provinces.clear();
      provinces.addAll(response?.data ?? []);
    });
  }

  void setProvinceSelected(Province province) {
    setState(ViewState.Busy);
    filter?.province = province;
    setState(ViewState.Idle);
  }
}
