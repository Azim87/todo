import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

class CustomPaginationView<R> extends StatefulWidget {
  const CustomPaginationView(
      {super.key, required this.itemBuilder, this.separator, required this.futureFactory, this.firstPageKey = 1, this.currentPageKey});

  final Future<List<R>> Function(int index) futureFactory;
  final ItemWidgetBuilder<R> itemBuilder;
  final Widget? separator;
  final int firstPageKey;
  final int? currentPageKey;

  @override
  CustomPaginationViewState<R> createState() => CustomPaginationViewState<R>(firstPageKey: firstPageKey);
}

class CustomPaginationViewState<R> extends State<CustomPaginationView<R>> {
  late final PagingController<int, R> _pagingController;
  final StreamController<int> _streamController = StreamController<int>();
  StreamSubscription<void>? _subscription;
  final int firstPageKey;

  CustomPaginationViewState({required this.firstPageKey});

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener((pageKey) {
      if (!_streamController.isClosed) {
        _streamController.sink.add(pageKey);
      }
    });

    _subscription = _streamController.stream.debounceTime(const Duration(milliseconds: 1000)).asyncMap(_fetchPageData).listen(null);
  }

  Future<void> _fetchPageData(int pageKey) async {
    try {
      List<R> newItems = await widget.futureFactory(pageKey);

      if (newItems.isEmpty) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void didUpdateWidget(covariant CustomPaginationView<R> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentPageKey == 0) _pagingController.refresh();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController.close();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: PagedListView<int, R>.separated(
          separatorBuilder: (_, __) => widget.separator ?? Container(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<R>(
            firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
            newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
            animateTransitions: true,
            itemBuilder: widget.itemBuilder,
          ),
        ),
      );
}
