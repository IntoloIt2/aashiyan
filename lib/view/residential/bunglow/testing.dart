import 'dart:convert';

import 'package:flutter/material.dart';
// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }
//   //Material(
//   //                  elevation: 5,
//   //                  child: GFMultiSelect(
//   //                    items:dropList,
//   //                    onSelect: (value) {
//   //                      print('selected $value ');
//   //                    },
//   //                    dropdownTitleTileText: 'Select feature',
//   //                    dropdownUnderlineBorder:
//   //                        const BorderSide(color: Colors.transparent, width: 2),
//   //                    // dropdownTitleTileBorder:
//   //                    //     Border.all(color: Colors.black, width: 1),
//   //                    dropdownTitleTileBorderRadius: BorderRadius.circular(5),
//   //                    dropdownTitleTileMargin: const EdgeInsets.all(1),
//   //                    dropdownTitleTilePadding:
//   //                        const EdgeInsets.symmetric(horizontal: 10),
//   //                    expandedIcon: const Icon(
//   //                      Icons.keyboard_arrow_down,
//   //                      color: Colors.black54,
//   //                    ),
//   //                    collapsedIcon: const Icon(
//   //                      Icons.keyboard_arrow_up,
//   //                      color: Colors.black54,
//   //                    ),
//   //                    submitButton: const Text('Submit'),
//   //                    cancelButton: const Text('Cancel'),
//   //                    dropdownTitleTileTextStyle: const TextStyle(
//   //                      fontSize: 14,
//   //                    ),
//   //                    padding: const EdgeInsets.all(0),
//   //                    margin: const EdgeInsets.all(0),
//   //                    type: GFCheckboxType.basic,
//   //                    inactiveBorderColor: Colors.grey,
//   //                  ),
//   //                ),
// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           child: _buildPanel(),
//         ),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               subtitle:
//                   const Text('To delete this panel, tap the trash can icon'),
//               trailing: const Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   _data.removeWhere((Item currentItem) => item == currentItem);
//                 });
//               }),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

// class MultiSelect extends StatefulWidget {
//   final List<String> items;
//   const MultiSelect({Key? key, required this.items}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
//   // this variable holds the selected items
//   final List<String> _selectedItems = [];

// // This function is triggered when a checkbox is checked or unchecked
//   void _itemChange(String itemValue, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         _selectedItems.add(itemValue);
//       } else {
//         _selectedItems.remove(itemValue);
//       }
//     });
//   }

//   // this function is called when the Cancel button is pressed
//   void _cancel() {
//     Navigator.pop(context);
//   }

// // this function is called when the Submit button is tapped
//   void _submit() {
//     Navigator.pop(context, _selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select Topics'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items
//               .map((item) => CheckboxListTile(
//                     value: _selectedItems.contains(item),
//                     title: Text(item),
//                     controlAffinity: ListTileControlAffinity.leading,
//                     onChanged: (isChecked) => _itemChange(item, isChecked!),
//                   ))
//               .toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: const Text('Cancel'),
//           onPressed: _cancel,
//         ),
//         ElevatedButton(
//           child: const Text('Submit'),
//           onPressed: _submit,
//         ),
//       ],
//     );
//   }
// }

// // Implement a multi select on the Home screen
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<String> _selectedItems = [];
//   void _showMultiSelect() async {
//     // a list of selectable items
//     // these items can be hard-coded or dynamically fetched from a database/API
//     final List<String> _items = [
//       'Flutter',
//       'Node.js',
//       'React Native',
//       'Java',
//       'Docker',
//       'MySQL',
//     ];

//     final List<String>? results = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return MultiSelect(items: _items);
//       },
//     );

//     // Update UI
//     if (results != null) {
//       setState(() {
//         _selectedItems = results;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // use this button to open the multi-select dialog
//             ElevatedButton(
//               child: const Text('Select Your Favorite Topics'),
//               onPressed: _showMultiSelect,
//             ),
//             const Divider(
//               height: 30,
//             ),
//             // display selected items
//             Wrap(
//               children: _selectedItems
//                   .map((e) => Chip(
//                         label: Text(e),
//                       ))
//                   .toList(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {
//   TextEditingController textEditingController = TextEditingController();
//   var velocityEditingController = TextEditingController();
//   var finalValue = TextEditingController();

//   int? airFlow;
//   int? velocity;
//   int? valueFinal;
//   String? sam2;
//   String? airFlowText, velocityText, finalText;
//   String sam = '';
//   @override
//   void initState() {
//     super.initState();
//     finalValue.addListener(() => setState(() {}));
//   }

//   String totalCalculated() {
//     airFlowText = textEditingController.text;

//     velocityText = velocityEditingController.text;

//     finalText = finalValue.text;

//     if (airFlowText != '' && velocityText != '') {
//       sam = (airFlow! + velocity!).toString();
//       finalValue.value = finalValue.value.copyWith(
//         text: sam.toString(),
//       );
//     }
//     return sam;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           TextFormField(
//             // key: Key(totalCalculated()),
//             controller: textEditingController,
//             onChanged: (textEditingController) {
//               setState(() {
//                 airFlow = int.parse(textEditingController.toString());
//               });
//             },
//             onTap: () {
//               setState(() {
//                 textEditingController.clear();
//               });
//             },
//             decoration: const InputDecoration(
//               hintText: 'Enter Value',

//               labelText: 'Air Flow',

//             ),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: velocityEditingController,
//             onChanged: (velocityEditingController) {
//               setState(() {
//                 velocity = int.parse(velocityEditingController.toString());
//                  });
//             },
//             decoration: const InputDecoration(
//               hintText: 'Enter Value',
//               labelText: 'Velocity',
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           TextFormField(
//             key: Key(totalCalculated()),
//             controller: finalValue,
//             onChanged: (value) {
//               setState(() {
//                 finalValue.value = finalValue.value.copyWith(
//                   text: value.toString(),
//                 );
//               });
//             },
//             onTap: () {
//               setState(() {
//                 finalValue.clear();
//                 finalValue.value = finalValue.value.copyWith(
//                   text: '',
//                 );
//               });
//             },
//             decoration: InputDecoration(
//               hintText: 'Enter Value',
//               labelText: 'Final Value',
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           Text('Entered Value is  $airFlow + $velocity + ${finalValue.text}'),
//         ],
//       ),
//     );
//   }
// }

// class TextField extends StatelessWidget {
//   TextEditingController nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: TextField(),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({key,required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>{

//    @override
//    void initState() {
//      super.initState();
//      Constants.allItems=[];
//      for(var k=1;k<=5;k++)
//      {
//       Constants.allItems.add(Cart(  menuName: getMenu(k)!, subMenu: getSubMenu(),),);
//      }
//     Constants.allItems.map((s){

//     }).map((list)=>list).toList();

//   }

//   @override
//   Widget build(BuildContext context) {

//     List<String>list= [];

//     return Scaffold(

//       appBar: AppBar(

//         title: Text(widget.title),
//       ),
//       body: Stack(

//         children: [
//           Opacity(opacity: .6,child: Image.network( "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwp3QntHc1KiYvEt-zoR3_k5KndhiaXTZKfw&usqp=CAU",width: double.infinity,height:double.infinity,fit: BoxFit.cover,)),
//           Center(

//               child: ListView.builder(
//                 itemCount: Constants.allItems.length,
//                 itemBuilder: (context,index){
//                   return  ListItem(index);
//                 },

//               )
//           )
//         ],
//       ),

//     );
//   }

//   String? getMenu(int month)
//   {
//     switch(month)
//     {
//       case 1:
//         return "Biryanis";
//       case 2:
//         return "Cool Drinks";
//       case 3:
//         return "Tiffins";
//       case 4:
//         return "Fast Food";
//       case 5:
//         return "Roties";

//     }
//   }

//   List<SubItem> getSubMenu()
//   {

//     return [ SubItem("Item 1",false,0), SubItem("Item 2",false,0), SubItem("Item 3",false,0)].toList();
//   }

// }

// class SubItem{

//   var title;

//   var isAdded=false;

//   var count;

//   SubItem(String title, bool isAdded, int count){
//     this.title=title;
//     this.isAdded=isAdded;
//     this.count=count;
//   }
// }

// class ListItem extends StatefulWidget{

//  int index;

//   ListItem(this.index);

//   @override
//   State<StatefulWidget>createState()
//   {
//     return ListItemState();
//   }
// }
// class ListItemState extends State<ListItem>
// {
//   bool isExpand=false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isExpand=false;
//   }
//   @override
//   Widget build(BuildContext context) {
//     List<SubItem> listItem = Constants.allItems[this.widget.index].subMenu;

//     return  Padding(
//       padding: (isExpand==true)?const EdgeInsets.all(8.0):const EdgeInsets.all(12.0),
//       child: Container(
//         decoration:BoxDecoration(
//             color: Colors.white,
//             borderRadius: (isExpand!=true)?BorderRadius.all(Radius.circular(8)):BorderRadius.all(Radius.circular(22)),
//             border: Border.all(color: Colors.black)
//         ),
//         child: ExpansionTile(
//           key: PageStorageKey<String>(Constants.allItems[this.widget.index].menuName),
//           title: Container(
//               width: double.infinity,

//               child: Text(Constants.allItems[this.widget.index].menuName,style: TextStyle(color:Colors.black,fontSize: (isExpand!=true)?18:22),)),
//           trailing: (isExpand==true)?Icon(Icons.arrow_drop_down,size: 32,color: Colors.pink,):Icon(Icons.arrow_drop_up,size: 32,color: Colors.pink),
//           onExpansionChanged: (value){
//             setState(() {
//               isExpand=value;
//             });
//           },
//           children:  getItems(listItem,this.widget.index),

//         ),
//       ),
//     );
//   }
//   getItems(List listItems,index)
//   {
//     List<Widget> listWidget=[];
//     for(int k=0;k<listItems.length;k++)
//       {
//         SubItem item=listItems[k];
//         listWidget.add( Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:Container(
//                 decoration:BoxDecoration(
//                   color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                     border: Border.all(color: Colors.blueGrey)
//                 ),
//               child: Column(
//                 children: [

//                   CheckboxListTile(
//                     title: new Text(item.title),
//                     value: item.isAdded,
//                     activeColor: Colors.pink,
//                     checkColor: Colors.white,
//                     onChanged: (value) {
//                       setState(() {
//                         item.isAdded = value!;
//                         if(value)
//                           {
//                             Constants.removeAll(index, k);
//                           }
//                       });
//                     },
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment:MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                           onTap: (){
//                             setState(() {

//                               Constants.addCartItem(index, k);

//                             });
//                           },
//                           child: Icon(Icons.add, color: Colors.green,size: 32,)),
//                       Container(
//                         margin: EdgeInsets.all(10),
//                         child: Text(
//                           "${item.count}",
//                           style: TextStyle(fontSize: 18.0, color: Colors.black),
//                         ),
//                       ),
//                       InkWell(
//                           onTap:(){
//                             setState(() {

//                               Constants.removeCartItem(index, k);

//                             });
//                           },
//                           child: Icon(Icons.remove, color: Colors.red,size: 32,)),
//                     ],),
//                 ],
//               ),
//             )

//         ));
//       }
//     return listWidget;
//   }
// }

// class Cart{

//   String menuName;
//   List<SubItem>subMenu;
// Cart({required this.menuName ,required this.subMenu});

// }

// class Constants
// {

//   static List<Cart> allItems=[];

//   static addCartItem(index,childIndex)
//   {
//     allItems[index].subMenu[childIndex].count++;
//   }
//   static removeCartItem(index,childIndex) {
//     if(allItems[index].subMenu[childIndex].count>1)
//     allItems[index].subMenu[childIndex].count--;
//   }

//   static void removeAll(index, int childIndex) {

//       allItems[index].subMenu[childIndex].count=0;
// }
//}

class dynmicTesting extends StatefulWidget {
  const dynmicTesting({Key? key}) : super(key: key);

  @override
  State<dynmicTesting> createState() => _dynmicTestingState();
}

class _dynmicTestingState extends State<dynmicTesting> {
  int count = 0;
  String result = "";
  List<Map<String, dynamic>>? _values;
  @override
  void initState() {
    super.initState();
    count = 0;
    _values = [];
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dynamic"),
        actions: [
          IconButton(
            onPressed: () {
              count = count + 1;
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              count = 0;
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _row(index);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(result),
        ]),
      ),
    );
  }

  _row(int key) {
    return Row(
      children: [
        Text("Id ${key}"),
        SizedBox(
          width: 30,
        ),
        Expanded(child: TextField(
          onChanged: (value) {
            _onUpdate(key, value);
          },
        )),
      ],
    );
  }

  _onUpdate(int key, String value) {
    Map<String, dynamic> json = {"id": key, "value": value};
    _values!.add(json);
    setState(() {
      result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(jsonObject);
  }
}
