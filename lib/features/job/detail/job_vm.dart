import 'dart:async';

import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/common/view_state.dart';
import 'package:job_search/data/model/career.dart';
import 'package:job_search/extension/bool_extension.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/extension/stream_extension.dart';

import '../../../data/repository/career_repository.dart';

enum JobState {
  careerApplied,
  careerSaved;
}

class JobViewModel extends BaseViewModel {
  final CareerRepository _careerRepository;

  JobViewModel(this._careerRepository);

  StreamController<JobState> onCareerListener = StreamController();

  void addToFavorite(Career job) {
    setState(ViewState.Busy);
    job.id?.let(
      (it) {
        safeCallApi(
          _careerRepository.saveCareer(it),
          onSuccess: (p0) {
            onCareerListener.addEventValid(JobState.careerSaved);
          },
          onComplete: () {
            setState(ViewState.Idle);
          },
        );
      },
    );
  }

  void applyCV(Career job) {
    setState(ViewState.Busy);
    job.id?.let(
      (it) {
        safeCallApi(
          _careerRepository.applyCareer(it),
          onSuccess: (p0) {
            onCareerListener.addEventValid(JobState.careerApplied);
          },
          onComplete: () {
            setState(ViewState.Idle);
          },
        );
      },
    );
  }
}
