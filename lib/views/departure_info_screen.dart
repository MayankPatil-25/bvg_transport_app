import 'package:bvg_transport_app/constants/bvg_assets.dart';
import 'package:bvg_transport_app/constants/bvg_colors.dart';
import 'package:bvg_transport_app/models/departures.dart';
import 'package:bvg_transport_app/models/stop.dart';
import 'package:bvg_transport_app/services/bvg_network.dart';
import 'package:bvg_transport_app/views/list_items/departure_info_item.dart';
import 'package:bvg_transport_app/widgets/custom_appbar_widgets.dart';
import 'package:flutter/material.dart';

class DepartureInfo extends StatefulWidget {
  const DepartureInfo({super.key, required this.selectedStop});

  final Stop selectedStop;

  @override
  State<StatefulWidget> createState() => _DepartureInfo();
}

class _DepartureInfo extends State<DepartureInfo> {
  late Future<List<Departure>> _detailFuture;
  final bvgService = BVGService();

  @override
  void initState() {
    super.initState();
    _detailFuture = bvgService.fetchDepartures(widget.selectedStop.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BvgColors.searchBarBackground,
        appBar: LargeSearchAppBar(
          hintText: widget.selectedStop.name,
          onClearPressed: _onClose,
          trailingIcon: BvgAsset.close,
        ),
        body: SafeArea(
            child: FutureBuilder<List<Departure>>(
          future: _detailFuture,
          builder: (context, snapshot) {
            // Handle loading/error states
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // Display data
            final departures = snapshot.data!;
            return ListView.builder(
              itemCount: departures.length,
              itemBuilder: (context, index) =>
                  DepartureInfoItem(departure: departures[index]),
            );
          },
        )));
  }

  void _onClose() {
    Navigator.pop(context);
  }
}
