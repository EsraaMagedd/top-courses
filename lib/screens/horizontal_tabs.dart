import 'package:flutter/material.dart';

class HorizontalTabs extends StatefulWidget {
  @override
  _HorizontalTabsState createState() => _HorizontalTabsState();
}

int _selectedTabIndex = 0;
List<String> _tabs = [' All ', ' Science ', ' Design ', ' Marketing ', ' Languages ',' Technologies '];


class _HorizontalTabsState extends State<HorizontalTabs> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 6),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade900),
                  borderRadius: BorderRadius.circular(15),
                  color: _selectedTabIndex == index
                      ? Colors.blue.shade900
                      : Colors.transparent,
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: _selectedTabIndex == index
                        ? Colors.white
                        : Colors.blue.shade900,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}