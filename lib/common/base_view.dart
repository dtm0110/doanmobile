import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';
import 'base_exception.dart';
import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;

  BaseView({
    required this.builder,
    this.onModelReady,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: ValueListenableBuilder<CommonException?>(
        valueListenable: model.commonError,
        builder: (BuildContext context, value, child) {
          if (value != null) {
            // centerDialog(context, mess: value.message ?? '');
            Timer.run(() {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value.message ?? '')));
            });
            model.commonError.value = null;
          }
          return Consumer<T>(
            builder: (context, viewModel, child) {
              return widget.builder.call(context, viewModel, child);
            },
          );
        },
      ),
    );
  }
}
