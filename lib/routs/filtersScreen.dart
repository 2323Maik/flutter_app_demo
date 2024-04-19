import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function setFiters;
  Map<String, bool> currentfilters;
  FiltersScreen(this.currentfilters, this.setFiters);

  State<StatefulWidget> createState() => FiltersScreenState();
}

//const ({ Key? key }) : super(key: key);
class FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegiterian = false;
  var _vegas = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentfilters['gluten']!;
    _lactoseFree = widget.currentfilters['lactose']!;
    _vegas = widget.currentfilters['vegan']!;
    _vegiterian = widget.currentfilters['vegitarian']!;
    super.initState();
  }

  Widget _buildSwitchTitleTile(
    String title,
    bool currentValue,
    String shortescription,
    Function(bool val) changedValue,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      value: currentValue,
      subtitle:
          Text(shortescription, style: Theme.of(context).textTheme.bodySmall),
      onChanged: changedValue,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter Page",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FittedBox(
                      child: Text("Adgust your meals bellow",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center),
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold),
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  onPressed: () {
                    final selectedFilter = {
                      "gluten": _glutenFree,
                      "lactose": _lactoseFree,
                      "vegan": _vegas,
                      "vegitarian": _vegiterian,
                    };

                    widget.setFiters(selectedFilter);
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTitleTile(
                "Gluten-free",
                _glutenFree,
                "Only gluten-frees meals are included",
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchTitleTile(
                "Lactose-free",
                _lactoseFree,
                "Only Lactose-free meals are included",
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchTitleTile(
                "Vegitarian",
                _vegiterian,
                "Only Vegitarians meals are included",
                (newValue) {
                  setState(() {
                    _vegiterian = newValue;
                  });
                },
              ),
              _buildSwitchTitleTile(
                "Vages",
                _vegas,
                "Only vegas meals are included",
                (newValue) {
                  setState(() {
                    _vegas = newValue;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
