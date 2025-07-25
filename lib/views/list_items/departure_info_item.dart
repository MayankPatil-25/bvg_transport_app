import 'package:bvg_transport_app/constants/bvg_assets.dart';
import 'package:bvg_transport_app/constants/bvg_colors.dart';
import 'package:bvg_transport_app/constants/bvg_text.dart';
import 'package:bvg_transport_app/models/departures.dart';
import 'package:bvg_transport_app/models/line.dart';
import 'package:bvg_transport_app/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DepartureInfoItem extends StatelessWidget {
  final Departure departure;

  const DepartureInfoItem({
    super.key,
    required this.departure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(spacing: 5, children: [
              // Main title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTransportIconWidgets(departure.line),
                    const SizedBox(height: 5),
                    Text(
                      departure.direction ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      departure.stop?.name ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              // Time and status row
              getDepartureTimeAndStatus()
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Divider(color: Colors.grey[200]))
        ],
      ),
    );
  }

  // get the departure item time and status widget
  Widget getDepartureTimeAndStatus() {
    var backgroundColor =
        (departure.delay ?? 0) > 0 ? Colors.red : Colors.green;
    var status = (departure.delay ?? 0) > 0 ? BvgText.delayed : BvgText.onTime;
    var localTime = departure.plannedWhen?.toLocal() ?? DateTime.now();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              DateFormat(BvgText.timeFormat_HHmm).format(localTime),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: backgroundColor[800]),
            ),
            const SizedBox(width: 8),
            Text(
              status,
              style: TextStyle(
                  fontSize: 12,
                  color: backgroundColor[800],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  // get the transport icon and transport number row widget/
  getTransportIconWidgets(Line? line) {
    return Row(
      spacing: 3,
      children: [
        WidgetUtils.getSvgImage(getTransportIconFromName(line),
            width: 23, height: 23),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: BvgColors.primaryTextColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            line?.name ?? '',
            style: TextStyle(
                fontSize: 14,
                color: BvgColors.primaryTextColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  String getTransportIconFromName(Line? line) {
    if (line == null) return '';
    switch (line.product) {
      case 'bus':
        return BvgAsset.bus;
      case 'express':
        return BvgAsset.express;
      case 'ferry':
        return BvgAsset.ferry;
      case 'regional':
        return BvgAsset.regional;
      case 'suburban':
        return BvgAsset.suburban;
      case 'subway':
        return BvgAsset.subway;
      case 'tram':
        return BvgAsset.tram;
      default:
        return '';
    }
  }
}
