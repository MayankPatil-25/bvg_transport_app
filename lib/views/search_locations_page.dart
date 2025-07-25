import 'package:bvg_transport_app/constants/bvg_assets.dart';
import 'package:bvg_transport_app/constants/bvg_colors.dart';
import 'package:bvg_transport_app/constants/bvg_text.dart';
import 'package:bvg_transport_app/models/stop.dart';
import 'package:bvg_transport_app/services/bvg_network.dart';
import 'package:bvg_transport_app/utils/search_debouncer.dart';
import 'package:bvg_transport_app/views/departure_info_screen.dart';
import 'package:bvg_transport_app/views/list_items/stop_info_item.dart';
import 'package:bvg_transport_app/widgets/custom_appbar_widgets.dart';
import 'package:flutter/material.dart';

class SearchLocationsPage extends StatefulWidget {
  const SearchLocationsPage({super.key});

  @override
  State<SearchLocationsPage> createState() => _SearchLocationsPageState();
}

class _SearchLocationsPageState extends State<SearchLocationsPage> {
  final bvgService = BVGService();
  Stop? selectedStop;
  List<Stop> _searchedStops = [];
  final SearchDebouncer _debouncer = SearchDebouncer(delay: Duration(milliseconds: 400));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BvgColors.searchBarBackground,
        appBar: LargeSearchAppBar(
          hintText: BvgText.searchStation,
          onTextChanged: onSearchChanged,
          onBackPressed: () => Navigator.of(context).pop(),
          onClearPressed: _onClear,
          leadingIcon: BvgAsset.arrowLeftAlt,
          trailingIcon: BvgAsset.cancel,
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: _searchedStops.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => listItemTapped(index),
                child: StopInfoItem(stop: _searchedStops[index])),
          ),
        )
    );
  }

  void onSearchChanged(String query) {
    query = query.trim();
    if (query.isEmpty) {
      setState(() => _searchedStops = []);
      return;
    }

    _debouncer.run(() async {
      try {
        final results = await bvgService.searchStopAsync(query);
        setState(() => _searchedStops = results);
      } catch (e) {
        print('Error: $e');
      }
    });
  }

  void _onClear() {
    setState(() {
      selectedStop = null;
      _searchedStops = [];
    });
  }

  listItemTapped(int index) async {
    var selectedItem = _searchedStops[index];
    // Handle tap here
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DepartureInfo(selectedStop: selectedItem)));
  }
}
