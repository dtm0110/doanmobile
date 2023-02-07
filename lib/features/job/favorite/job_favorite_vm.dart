import 'package:job_search/common/base_view_model.dart';

import '../../../common/view_state.dart';
import '../../../data/model/career.dart';
import '../../../data/model/career_response.dart';
import '../../../data/repository/career_repository.dart';

class JobFavoriteViewModel extends BaseViewModel {
  final CareerRepository _careerRepository;
  List<Career> careers = [];

  JobFavoriteViewModel(this._careerRepository);

  Future<void> getListCareer() async {
    setState(ViewState.Busy);
    safeCallApi<CareerResponse>(
      _careerRepository.getListCareerSaved(),
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
