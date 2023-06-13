import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_flutter/constants.dart';
import 'package:test_app_flutter/feature/data/models/address_model.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String date;
  final AddressModel city;

  MainAppBar({
    required this.date,
    required this.city,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImageIcon(AssetImage("assets/icons/location.png"),
              size: 24, color: Colors.black),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city.address, style: APPBAR_TEXT_STYLE),
              const SizedBox(height: 4),
              Text(date.toString(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      ),
      automaticallyImplyLeading: true,
      elevation: 0,
      backgroundColor: Colors.white,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: standardPadding),
          child: CircleAvatar(),
        )
      ],
    );
  }
}
