import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/data/repository/career_repository.dart';

import '../../../common/view_state.dart';
import '../../../data/model/career.dart';
import '../../../data/model/career_response.dart';

class JobAppliedViewModel extends BaseViewModel {
  final CareerRepository _careerRepository;
  List<Career> careers = [];

  JobAppliedViewModel(this._careerRepository);

  Future<void> getListCareer() async {
    setState(ViewState.Busy);
    safeCallApi<CareerResponse>(
      _careerRepository.getListCareerApplied(),
      onSuccess: (response) {
        careers.clear();
        careers.addAll(response?.data ?? []);
        notifyListeners();
      },
      onComplete: () {
        setState(ViewState.Idle);
      },
    );
  }
}
