import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlocProvider<T> extends InheritedWidget {
  final T create;

  final bool Function(T, T) _updateShouldNotify;

  const BlocProvider({
    Key key,
    Widget child,
    @required this.create,
    bool updateShouldNotify(T previous, T current),
  })  : assert(create != null),
        _updateShouldNotify = updateShouldNotify ?? _notEquals,
        super(key: key, child: child);

  static T of<T>(BuildContext context, {bool listen = true}) {
    final BlocProvider<T> provider = listen ? context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>() : context.getElementForInheritedWidgetOfExactType<BlocProvider<T>>()?.widget;
    if (provider == null) {
      throw BlocProviderError(_typeOf<BlocProvider<T>>());
    }
    return provider.create;
  }

  @override
  bool updateShouldNotify(BlocProvider<T> old) => _updateShouldNotify(old.create, create);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('create', create));
  }

  static bool _notEquals(previous, current) => previous != current;

  static Type _typeOf<T>() => T;

  BlocProvider<T> copyWith(Widget child) => BlocProvider<T>(child: child, create: create, key: key, updateShouldNotify: _updateShouldNotify);
}

class BlocProviderError extends Error {
  final Type type;

  BlocProviderError(this.type);

  @override
  String toString() {
    return '''Error: No $type found.''';
  }
}

class MultiBlocProvider extends StatelessWidget {
  final List<BlocProvider<dynamic>> providers;

  final Widget child;

  const MultiBlocProvider({Key key, @required this.providers, @required this.child})
      : assert(providers != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => providers.reversed.fold(child, (Widget widget, BlocProvider<dynamic> provider) => provider.copyWith(widget));
}

class Consumer<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T t) builder;

  const Consumer({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(context, BlocProvider.of<T>(context));
}

class Consumer2<A, B> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b) builder;

  const Consumer2({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(context, BlocProvider.of<A>(context), BlocProvider.of<B>(context));
}

class Consumer3<A, B, C> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c) builder;

  const Consumer3({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
      );
}

class Consumer4<A, B, C, D> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c, D d) builder;

  const Consumer4({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
        BlocProvider.of<D>(context),
      );
}

class Consumer5<A, B, C, D, E> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c, D d, E e) builder;

  const Consumer5({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
        BlocProvider.of<D>(context),
        BlocProvider.of<E>(context),
      );
}

class Consumer6<A, B, C, D, E, F> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c, D d, E e, F f) builder;

  const Consumer6({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
        BlocProvider.of<D>(context),
        BlocProvider.of<E>(context),
        BlocProvider.of<F>(context),
      );
}

class Consumer7<A, B, C, D, E, F, G> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c, D d, E e, F f, G g) builder;

  const Consumer7({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
        BlocProvider.of<D>(context),
        BlocProvider.of<E>(context),
        BlocProvider.of<F>(context),
        BlocProvider.of<G>(context),
      );
}

class Consumer8<A, B, C, D, E, F, G, H> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c, D d, E e, F f, G g, H h) builder;

  const Consumer8({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
        BlocProvider.of<D>(context),
        BlocProvider.of<E>(context),
        BlocProvider.of<F>(context),
        BlocProvider.of<G>(context),
        BlocProvider.of<H>(context),
      );
}

class Consumer9<A, B, C, D, E, F, G, H, I> extends StatelessWidget {
  final Widget Function(BuildContext context, A a, B b, C c, D d, E e, F f, G g, H h, I i) builder;

  const Consumer9({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => builder(
        context,
        BlocProvider.of<A>(context),
        BlocProvider.of<B>(context),
        BlocProvider.of<C>(context),
        BlocProvider.of<D>(context),
        BlocProvider.of<E>(context),
        BlocProvider.of<F>(context),
        BlocProvider.of<G>(context),
        BlocProvider.of<H>(context),
        BlocProvider.of<I>(context),
      );
}
