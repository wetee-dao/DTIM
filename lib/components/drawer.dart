import 'package:flutter/material.dart';

import '../components/search_element.dart';

class WidgetDrawer extends StatefulWidget {
  const WidgetDrawer({Key? key}) : super(key: key);

  @override
  State<WidgetDrawer> createState() => _WidgetDrawerState();
}

class _WidgetDrawerState extends State<WidgetDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Workspaces',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            child: const Text(
                              'AW',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Artur Workspace',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'yoururl.slack.com',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.more_horiz,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Divider(),
              WidgetSearchElement(Icons.add_circle_outline, 'Add a Workspace', Icons.access_time, '  '),
              WidgetSearchElement(Icons.settings, 'Preferences', Icons.access_time, '  '),
              WidgetSearchElement(Icons.help_outline, 'Help', Icons.access_time, '  '),
              const SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
