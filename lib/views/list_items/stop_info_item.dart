import 'package:bvg_transport_app/constants/bvg_assets.dart';
import 'package:bvg_transport_app/models/stop.dart';
import 'package:bvg_transport_app/widgets/widget_utils.dart';
import 'package:flutter/material.dart';

class StopInfoItem extends StatelessWidget {
  final Stop stop;

  const StopInfoItem({required this.stop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: [
        Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 1),
                  width: 50,
                  child: WidgetUtils.getSvgImage(BvgAsset.exploreNearby,
                      width: 23, height: 23)),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                    Text(stop.name ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    getTransportIcons(stop)
                  ])),
              Container(
                alignment: Alignment.center,
                width: 50,
                child: WidgetUtils.getSvgImage(BvgAsset.chevron,
                    width: 25, height: 25),
              )
            ]),
        Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Divider(color: Colors.grey[200]))
      ]),
    );
  }

  Row getTransportIcons(Stop stop) {
    var icons = List<Widget>.empty(growable: true);

    //  bus
    if (stop.products?.bus == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.bus));
    }

    // express
    if (stop.products?.express == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.express));
    }

    // ferry
    if (stop.products?.ferry == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.ferry));
    }

    // regional
    if (stop.products?.regional == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.regional));
    }

    // suburban
    if (stop.products?.suburban == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.suburban));
    }

    // subway
    if (stop.products?.subway == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.subway));
    }

    // tram
    if (stop.products?.tram == true) {
      icons.add(WidgetUtils.getSvgImage(BvgAsset.tram));
    }

    return Row(children: icons, spacing: 5);
  }
}
