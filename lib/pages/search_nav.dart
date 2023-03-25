import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../components/search_element.dart';
import '../../utils/screen.dart';
import '../../utils/functions.dart';
import '../store/theme.dart';

class SearchPageNav extends StatefulWidget {
  const SearchPageNav({Key? key}) : super(key: key);

  @override
  State<SearchPageNav> createState() => _SearchPageNavState();
}

class _SearchPageNavState extends State<SearchPageNav> {
  late FocusNode focusNode;
  double coefWidthField = 0.9;
  double coefWidthCancel = 0;
  TextInputType keyBoard = TextInputType.text;
  late ExpandableController _expandableController;

  @override
  void initState() {
    super.initState();
    _expandableController = ExpandableController(initialExpanded: true);
  }

  @override
  void dispose() {
    super.dispose();
    _expandableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: constTheme.sidebarBg,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastLinearToSlowEaseIn,
                height: 40,
                width: MediaQuery.of(context).size.width * coefWidthField,
                child: TextField(
                  onTap: () {
                    setState(() {
                      coefWidthField = 0.66;
                      _expandableController.toggle();
                    });
                    Timer(const Duration(milliseconds: 700), () {
                      setState(() {
                        coefWidthCancel = 0.25;
                      });
                    });
                  },
                  keyboardType: keyBoard,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: constTheme.centerChannelColor,
                      size: 21.w,
                    ),
                    hintText: 'Enter a search item',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.w400,
                      height: 0.5,
                    ),
                    fillColor: constTheme.centerChannelColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: "502D52".toColor()),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: "502D52".toColor()),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: "502D52".toColor()),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * coefWidthCancel,
                alignment: Alignment.center,
                height: 40,
                // decoration: BoxDecoration(
                //     color: Colors.white
                // ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      coefWidthField = 0.9;
                      coefWidthCancel = 0;
                      _expandableController.toggle();
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expandable(
                controller: _expandableController,
                collapsed: SizedBox(),
                expanded: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Column(
                    children: [
                      WidgetSearchElement(
                          Icons.person_pin_outlined, 'Browse People', Icons.arrow_forward_ios_outlined, ''),
                      WidgetSearchElement(
                          Icons.search_off_outlined, 'Browse Channels', Icons.arrow_forward_ios_outlined, ''),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  'Recent Searches',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              WidgetSearchElement(Icons.access_time, 'in:@jack where', Icons.close, ''),
              WidgetSearchElement(Icons.access_time, 'qwerty', Icons.close, ''),
              WidgetSearchElement(Icons.access_time, 'dota2', Icons.close, ''),
              WidgetSearchElement(Icons.access_time, 'where is my mind?', Icons.close, ''),
              Divider(
                color: Colors.grey,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  'Narrow Your Search',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              WidgetSearchElement(Icons.plumbing_sharp, 'from:', Icons.close, 'Ex. @jackrassel'),
              WidgetSearchElement(Icons.plumbing_sharp, 'is:', Icons.close, 'Ex. saved'),
              WidgetSearchElement(Icons.plumbing_sharp, 'after:', Icons.close, 'Ex. 2022-12-12'),
              WidgetSearchElement(Icons.plumbing_sharp, 'in:', Icons.close, 'Ex. #project'),
            ],
          ),
        ),
      ),
    );
  }
}
