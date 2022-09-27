import 'package:demo_app/provider/base_model.dart';
import 'package:demo_app/provider/getit.dart';
import 'package:flutter/material.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDisposed;
  final Widget? child;

  const BaseView({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.child,
    this.onModelDisposed,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = getIt<T>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
