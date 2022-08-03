import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}

// Implement a multi select on the Home screen
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _selectedItems = [];
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // use this button to open the multi-select dialog
            ElevatedButton(
              child: const Text('Select Your Favorite Topics'),
              onPressed: _showMultiSelect,
            ),
            const Divider(
              height: 30,
            ),
            // display selected items
            Wrap(
              children: _selectedItems
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  TextEditingController textEditingController = TextEditingController();
  var velocityEditingController = TextEditingController();
  var finalValue = TextEditingController();

  int? airFlow;
  int? velocity;
  int? valueFinal;
  String? sam2;
  String? airFlowText, velocityText, finalText;
  String sam = '';
  @override
  void initState() {
    super.initState();
    finalValue.addListener(() => setState(() {}));
  }

  String totalCalculated() {
    airFlowText = textEditingController.text;

    velocityText = velocityEditingController.text;

    finalText = finalValue.text;

    if (airFlowText != '' && velocityText != '') {
      sam = (airFlow! + velocity!).toString();
      finalValue.value = finalValue.value.copyWith(
        text: sam.toString(),
      );
    }
    return sam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            // key: Key(totalCalculated()),
            controller: textEditingController,
            onChanged: (textEditingController) {
              setState(() {
                airFlow = int.parse(textEditingController.toString());
              });
            },
            onTap: () {
              setState(() {
                textEditingController.clear();
              });
            },
            decoration: const InputDecoration(
              hintText: 'Enter Value',

              labelText: 'Air Flow',

            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: velocityEditingController,
            onChanged: (velocityEditingController) {
              setState(() {
                velocity = int.parse(velocityEditingController.toString());
                 });
            },
            decoration: const InputDecoration(
              hintText: 'Enter Value',
              labelText: 'Velocity',
            ),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            key: Key(totalCalculated()),
            controller: finalValue,
            onChanged: (value) {
              setState(() {
                finalValue.value = finalValue.value.copyWith(
                  text: value.toString(),
                );
              });
            },
            onTap: () {
              setState(() {
                finalValue.clear();
                finalValue.value = finalValue.value.copyWith(
                  text: '',
                );
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter Value',
              labelText: 'Final Value',
            ),
            keyboardType: TextInputType.number,
          ),
          Text('Entered Value is  $airFlow + $velocity + ${finalValue.text}'),
        ],
      ),
    );
  }
}
