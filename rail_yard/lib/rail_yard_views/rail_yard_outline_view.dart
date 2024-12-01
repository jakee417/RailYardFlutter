import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/rail_yard_views/rail_yard_profile_view.dart';
import 'package:rail_yard/rail_yard_views/rail_yard_view.dart';

class RailYardOutlineView extends StatefulWidget {
  const RailYardOutlineView(
      {super.key, required this.startingIndex, required this.totalDevices});
  final int startingIndex;
  final int totalDevices;

  @override
  State<RailYardOutlineView> createState() => _RailYardOutlineView();
}

class _RailYardOutlineView extends State<RailYardOutlineView>
    with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabController;
  late int index;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.startingIndex);
    tabController = TabController(
      initialIndex: widget.startingIndex,
      length: widget.totalDevices,
      vsync: this,
    );
    index = widget.startingIndex;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceManager = context.read<DeviceManagers>().getManager(index);
    return Scaffold(
      appBar: AppBar(
        title: Text(deviceManager?.serverSettings.name ?? ''),
        actions: [
          ElevatedButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (BuildContext context) =>
                  RailYardProfileView(index: index),
            ),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 5,
            ),
            child: Icon(
              Icons.save,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: PageView(
              pageSnapping: true,
              onPageChanged: handlePageViewChanged,
              controller: pageController,
              children: List.generate(widget.totalDevices,
                  (i) => Center(child: RailYardView(index: i))),
            ),
          ),
          widget.totalDevices > 1
              ? PageIndicator(
                  tabController: tabController,
                  currentPageIndex: index,
                  onUpdateCurrentPageIndex: updateCurrentPageIndex,
                  isOnDesktopAndWeb: _isOnDesktopAndWeb,
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

  void handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    tabController.index = currentPageIndex;
    setState(() {
      index = currentPageIndex;
    });
  }

  void updateCurrentPageIndex(int index) {
    tabController.index = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
