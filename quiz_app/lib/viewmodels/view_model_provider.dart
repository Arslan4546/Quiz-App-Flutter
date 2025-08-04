import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/viewmodels/base_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;
  final T viewModel;
  final Function(T)? onViewModelReady;
  final Widget? child;

  const ViewModelProvider({
    Key? key,
    required this.builder,
    required this.viewModel,
    this.onViewModelReady,
    this.child,
  }) : super(key: key);

  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends BaseViewModel> extends State<ViewModelProvider<T>> {
  late T _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    if (widget.onViewModelReady != null) {
      widget.onViewModelReady!(_viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: _viewModel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}