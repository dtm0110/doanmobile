import 'dart:async';

import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/common/view_state.dart';
import 'package:job_search/data/model/career_response.dart';
import 'package:job_search/extension/stream_extension.dart';
import 'package:job_search/extension/string_extension.dart';

import '../../data/model/career.dart';
import '../../data/model/filter_arguments.dart';
import '../../data/repository/career_repository.dart';

class HomeViewModel extends BaseViewModel {
  // List<Career> careers = [];
  FilterArguments filter = FilterArguments();
  final CareerRepository _careerRepository;
  StreamController<List<Career>> careers = StreamController();

  HomeViewModel(this._careerRepository);

  Future<void> initData() async {
    getListCareer();
  }

  void onSearch(String p0) {
    filter.search = p0.emptyOrNull ? null : p0;
    getListCareer();
  }

  void doSearch(String key) {
    filter.search = key.emptyOrNull ? null : key;
    getListCareer();
  }

  void filterList(FilterArguments filterArguments) {
    filter = filterArguments;
    getListCareer();
  }

  Future<void> getListCareer() async {
    setState(ViewState.Busy);
    safeCallApi<CareerResponse>(_careerRepository.getListCareer(filter),
        onSuccess: (response) {
      careers.addEventValid(response?.data ?? []);
      // careers.addAll(response?.data ?? []);
    }, onComplete: () {
      setState(ViewState.Idle);
    });
  }
}
