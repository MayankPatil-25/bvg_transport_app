import 'package:bvg_transport_app/constants/bvg_colors.dart';
import 'package:bvg_transport_app/constants/bvg_text.dart';
import 'package:bvg_transport_app/views/search_locations_page.dart';
import 'package:flutter/material.dart';

class TransportInfoPage extends StatelessWidget {
  const TransportInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Even taller app bar
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 15,
            children: [
              AppBar(
                backgroundColor: BvgColors.searchBarBackground,
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Light grey background from screenshot
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      // Handle tap here
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchLocationsPage()));
                    },
                    child: const TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: BvgColors.primaryTextColor,
                          size: 19,
                        ),
                        hintText: BvgText.searchStation,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 13),
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: BvgColors.primaryTextColor,
                height: 1,
                alignment: AlignmentDirectional.bottomEnd,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: BvgColors.pageBackgroundColor,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text('👀', style: TextStyle(fontSize: 40)),
                const SizedBox(height: 16),
                const Text(
                  BvgText.titleFindBestTransportConnections,
                  style: TextStyle(
                    fontSize: 32,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  BvgText.descriptionFindBestTransportConnections,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16),
                const Text(
                  BvgText.titleCuppingAestheticChambray,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  BvgText.descriptionCuppingAestheticChambray,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 16),
                const Text(
                  BvgText.titleIntelligentsiaAsymmetrical,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  BvgText.descriptionIntelligentsiaAsymmetrical,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
