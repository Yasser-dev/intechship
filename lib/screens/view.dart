import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../app/size_config.dart';
import '../app/dependencies.dart';
import 'viewmodel.dart';

//----------------------------------------------------------------------------
// Default View is with Selector and ChangeNotifierProvier
//----------------------------------------------------------------------------

class View<T extends Viewmodel> extends StatelessWidget {
  final Widget Function(BuildContext context, T viewmodel, Widget child)
      builder;

  final void Function(T viewmodel) initViewmodel;

  View({@required this.builder, this.initViewmodel});

  T _setupViewmodel() {
    final viewmodel = dependency<T>();
    if (initViewmodel != null) {
      initViewmodel(viewmodel);
    }
    return viewmodel;
  }

  Widget _builder(BuildContext context, T viewmodel, Widget child) {
    if (viewmodel.busy) {
      return Center(
        child: Scaffold(
            body: Center(
                child: SpinKitCubeGrid(
          size: SizeConfig.blockSizeHorizontal * 10,
          color: Theme.of(context).primaryColor,
        ))),
      );
    }

    return builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _setupViewmodel(),
        child: Consumer<T>(builder: _builder),
      );
}

class SelectorView<T extends Viewmodel, R> extends View<T> {
  final R Function(BuildContext context, T viewmodel) selector;

  SelectorView({@required this.selector, @required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);

  Widget _selectorBuilder(
      BuildContext context, R selectorResult, Widget child) {
    final viewmodel = dependency<T>();
    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _setupViewmodel(),
        child: Selector<T, R>(selector: selector, builder: _selectorBuilder),
      );
}
