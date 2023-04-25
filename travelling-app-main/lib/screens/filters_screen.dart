// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer'];
     _winter = widget.currentFilters['winter'];
      _family = widget.currentFilters['family'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, var currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الفلترة'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final SelectedFilters = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(SelectedFilters);
              },
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    'الرحلات الصيفية فقط',
                    'اظهار الرحلات في فصل الصيف فقط',
                    _summer,
                    (newValue) {
                      setState(() {
                        _summer = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'الرحلات الشتوية فقط',
                    'اظهار الرحلات في فصل الشتاء فقط',
                    _winter,
                    (newValue) {
                      setState(() {
                        _winter = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                      'للعائلات', 'اظهار الرحلات التي للعائلات فقط', _family,
                      (newValue) {
                    setState(() {
                      _family = newValue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
