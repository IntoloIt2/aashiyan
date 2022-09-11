import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
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
  List<Map<String, dynamic>> _values = [];
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
              setState(() {
                count = count + 1;
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                count = 0;
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              itemCount: count,
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
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey("id")) {
        if (map["id"] == key) {
          print("$foundKey ${map["id"]} ");
          foundKey = key;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        print("${map["id"] == foundKey} ${map["id"]} ");
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {"id": key, "value": value};
    _values.add(json);
    setState(() {
      result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(jsonObject);
  }
}

// import 'package:flutter/material.dart';

// import '../../../components/forms.dart';
// import '../../../const.dart';
// import '../../../controller/api_services.dart';

// List<BedRoom> users = [];

// class MultiForm extends StatefulWidget {
//   @override
//   _MultiFormState createState() => _MultiFormState();
// }

// class _MultiFormState extends State<MultiForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: .0,
//         leading: Icon(
//           Icons.wb_cloudy,
//         ),
//         title: Text('REGISTER USERS'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Save'),
//             textColor: Colors.white,
//             onPressed: () {
//               var userdata = users.map((it) => it.user).toList();
//               for (int i = 0; i < userdata.length; i++) {
//                 print(users[i].user!.fullName);
//                 print(users[i].user!.email);
//               }
//             },
//           )
//         ],
//       ),
//       body: Container(
//         child: users.length <= 0
//             ? Center(
//                 child: EmptyState(
//                   title: 'Oops',
//                   message: 'Add form by tapping add button below',
//                 ),
//               )
//             : ListView.builder(
//                 addAutomaticKeepAlives: true,
//                 itemCount: users.length,
//                 itemBuilder: (_, i) => users[i],
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: onAddForm,
//         foregroundColor: Colors.white,
//       ),
//     );
//   }

//   ///on form user deleted
//   void onDelete(User _user) {
//     setState(() {
//       var find = users.firstWhere(
//         (it) => it.user == _user,
//         // orElse: () => null,
//       );
//       if (find != null) users.removeAt(users.indexOf(find));
//     });
//   }

//   ///on add form
//   void onAddForm() {
//     setState(() {
//       var _user = User();
//       users.add(BedRoom(
//         user: _user,
//         onDelete: () => onDelete(_user),
//       ));
//     });
//   }

//   ///on save forms
//   void onSave() {
//     if (users.length > 0) {
//       var userdata = users.map((it) => it.user).toList();
//       for (int i = 0; i < userdata.length; i++) {
//         print(users[i].user!.fullName);
//         print(users[i].user!.email);
//       }
//       var allValid = true;

//       var data = users.map((it) => it.user).toList();
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           fullscreenDialog: true,
//           builder: (_) => Scaffold(
//             appBar: AppBar(
//               title: Text('List of Users'),
//             ),
//             body: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (_, i) => ListTile(
//                 leading: CircleAvatar(
//                   child: Text(data[i]!.fullName.substring(0, 1)),
//                 ),
//                 title: Text(data[i]!.fullName),
//                 subtitle: Text(data[i]!.email),
//               ),
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 var data = users.map((it) => it.user).toList();
//                 for (int i = 0; i < data.length; i++) {
//                   print(users[i].user!.fullName);
//                   print(users[i].user!.email);
//                 }
//               },
//               child: Icon(Icons.add),
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

// class User {
//   String fullName;
//   String email;

//   User({this.fullName = '', this.email = ''});
// }

// typedef OnDelete();

// class UserForm extends StatefulWidget {
//   final User? user;
//   final state = _UserFormState();
//   final OnDelete? onDelete;

//   UserForm({Key? key, this.user, this.onDelete}) : super(key: key);
//   @override
//   _UserFormState createState() => state;

//   bool isValid() => state.validate();
// }

// class _UserFormState extends State<UserForm> {
//   final form = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Material(
//         elevation: 1,
//         clipBehavior: Clip.antiAlias,
//         borderRadius: BorderRadius.circular(8),
//         child: Form(
//           key: form,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               AppBar(
//                 leading: Icon(Icons.verified_user),
//                 elevation: 0,
//                 title: Text('User Details'),
//                 backgroundColor: Theme.of(context).accentColor,
//                 centerTitle: true,
//                 actions: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: widget.onDelete,
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 16, right: 16, top: 16),
//                 child: TextFormField(
//                   initialValue: widget.user!.fullName,
//                   onSaved: (val) => widget.user!.fullName = val!,
//                   validator: (val) =>
//                       val!.length > 3 ? null : 'Full name is invalid',
//                   decoration: InputDecoration(
//                     labelText: 'Full Name',
//                     hintText: 'Enter your full name',
//                     icon: Icon(Icons.person),
//                     isDense: true,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
//                 child: TextFormField(
//                   initialValue: widget.user!.email,
//                   onSaved: (val) => widget.user!.email = val!,
//                   validator: (val) =>
//                       val!.contains('@') ? null : 'Email is invalid',
//                   decoration: InputDecoration(
//                     labelText: 'Email Address',
//                     hintText: 'Enter your email',
//                     icon: Icon(Icons.email),
//                     isDense: true,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }




// class BedRoom extends StatefulWidget {
//   static const namedRoute = "/namedRoute";

//   // int? index;
//   // Function? removeServiceCard;
//   // bool isExpanded;
//   // String personBedroomController = '';

//   final User? user;

//   final OnDelete? onDelete;

  // String? bedroomLengt;
  // int? bedroom;
  // int? bedRoomFloor;
  // String? bedRoomWidth;
  // String bedRoomArea = "400";
  // String? bedRoomToiletLength;
  // String? bedRoomToiletWidth;
  // String? bedRoomToiletArea;
  // String? bedRoomToiletReqText;
  // String? bedroomDressRequirment;
  // String? bedroomDressLength;
  // String? bedroomDressWidth;
  // String? bedroomDressArea;
  // String? bedroomDressFacility;
  // String? bedroomDressRequirmentText;
  // String? bedroomImg;
  // String? bedroomFacility;
  // String? bedroomFacilityRequirementText;

//   String? selectedFloor = "select Floor";
//   List<String> floorItems = [
//     "select Floor",
//     "Ground Floor",
//     "1st Floor",
//     "2nd Floor",
//     "3rd Floor",
//     "other"
//   ];

//   BedRoom({this.user, this.onDelete});

//   @override
//   State<BedRoom> createState() => _BedRoomState();
// }

// class _BedRoomState extends State<BedRoom> {
//   onUpdate(int key, String length, String width) {
//     int foundKey = -1;
//     for (var map in values) {
//       if (map.containsKey("id")) {
//         if (map["id"] == key) {
//           print("$foundKey ${map["id"]} ");
//           foundKey = key;
//           break;
//         }
//       }
//     }
//     if (-1 != foundKey) {
//       values.removeWhere((map) {
//         print("${map["id"] == foundKey} ${map["id"]}");
//         return map["id"] == foundKey;
//       });
//     }
//     Map<String, dynamic> json = {
//       "id": key,
//       "bedroom_length": length,
//       "bedroom_width": width,
//     };
//     // Map<String, dynamic> json = {
//     //   "bed": {
//     //     "id": key,
//     //     "bedroom_length": length,
//     //     "bedroom_width": width,
//     //   }
//     // };

//     values.add(json);
//     setState(() {
//       var result = _prettyPrint(values);
//     });
//     print(values);
//   }

//   String _prettyPrint(jsonObject) {
//     var encoder = const JsonEncoder.withIndent('  ');
//     return encoder.convert(jsonObject);
//   }

//   List<Map<String, dynamic>> values = [];
//   bool? requiredDress = false;
//   bool? notRequiredDress = false;

//   @override
//   void initState() {
//     //Initialize with 1 item
//     super.initState();
//     // getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return ExpansionTile(
//         maintainState: true,
//         title: Text(
//           'BedRoom Details',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: width * 1,
//                 color: color3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         requirementText("Select Person bedroom"),
//                         SizedBox(
//                           width: width * 0.02,
//                         ),
//                         Material(
//                           elevation: 5,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(5)),
//                           child: SizedBox(
//                             height: height * 0.04,
//                             width: width * 0.5,
//                             child: TextFormField(
//                               style: const TextStyle(fontSize: 14),
//                               decoration: const InputDecoration(
//                                 hintText:
//                                     "Son's Room , Daughter Room , Mother room's",
//                                 hintStyle: TextStyle(fontSize: 14),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 isDense: true,
//                                 contentPadding: EdgeInsets.all(8),
//                                 //fillColor: Colors.green
//                               ),
//                               onChanged: (value) {
//                                 setState(() {
//                                   widget.user!.email = value;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         requirementText("Length"),
//                         SizedBox(
//                           width: width * 0.015,
//                         ),
//                         Material(
//                           elevation: 5,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(5)),
//                           child: SizedBox(
//                             height: height * 0.04,
//                             width: width * 0.15,
//                             child: TextFormField(
//                               style: const TextStyle(fontSize: 14),
//                               decoration: const InputDecoration(
//                                   hintText: "Length",
//                                   hintStyle: TextStyle(fontSize: 14),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   isDense: true,
//                                   contentPadding: EdgeInsets.all(8)
//                                   //fillColor: Colors.green
//                                   ),
//                               onChanged: (value) {
//                                 widget.user!.fullName = value;
//                               },
//                               onFieldSubmitted: (value) {
//                                 print(values);
//                               },
//                               // onSaved: (newValue) {
//                               // widget.bedroomLength = newValue;
//                               // getData();
//                               // },
//                             ),
//                           ),
//                         ),
//                         valueContainer(height, width, size, 0.04, 0.05),
//                         SizedBox(
//                           width: width * 0.02,
//                         ),
//                         requirementText("Width"),
//                         SizedBox(
//                           width: width * 0.015,
//                         ),
//                         requirementTextField(
//                             height, width, 0.04, 0.15, "Width"),
//                         valueContainer(height, width, size, 0.04, 0.05),
//                         SizedBox(
//                           width: width * 0.15,
//                         ),
//                         Row(
//                           children: [
//                             requirementText("help"),
//                             IconButton(
//                                 padding: EdgeInsets.all(5),
//                                 constraints: BoxConstraints(),
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.help,
//                                   size: height * 0.03,
//                                 ))
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: height * .01,
//                     ),
//                     Row(
//                       children: [
//                         requirementText("Floor"),
//                         Material(
//                           elevation: 5,
//                           borderRadius: BorderRadius.circular(5),
//                           child: Container(
//                             height: height * 0.03,
//                             width: width * 0.6,
//                             margin: const EdgeInsets.all(
//                               3,
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                   icon: const Visibility(
//                                       visible: false,
//                                       child: Icon(Icons.arrow_downward)),
//                                   value: widget.selectedFloor,
//                                   elevation: 16,
//                                   items: widget.floorItems
//                                       .map((it) => DropdownMenuItem<String>(
//                                           value: it,
//                                           child: Text(
//                                             it,
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                           )))
//                                       .toList(),
//                                   onChanged: (it) => setState(
//                                       () => widget.selectedFloor = it!)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     requirementText("Toilet details"),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         requirementText("Length"),
//                         SizedBox(
//                           width: width * 0.015,
//                         ),
//                         requirementTextField(
//                             height, width, 0.04, 0.15, "length"),
//                         valueContainer(height, width, size, 0.04, 0.05),
//                         SizedBox(
//                           width: width * 0.02,
//                         ),
//                         requirementText("Width"),
//                         SizedBox(
//                           width: width * 0.015,
//                         ),
//                         requirementTextField(
//                             height, width, 0.04, 0.15, "Width"),
//                         valueContainer(height, width, size, 0.04, 0.05),
//                         SizedBox(
//                           width: width * 0.15,
//                         ),
//                         Row(
//                           children: [
//                             requirementText("help"),
//                             IconButton(
//                                 padding: EdgeInsets.all(5),
//                                 constraints: BoxConstraints(),
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.help,
//                                   size: height * 0.03,
//                                 ))
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     requirementText("Toilet Facility"),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     requirementTextField(
//                         height, width, 0.04, 0.9, "Other Toilet Facility"),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     requirementText("Dress Details"),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             Material(
//                               borderRadius: BorderRadius.circular(5),
//                               elevation: 5,
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 10),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       height: height * 0.04,
//                                       child: Checkbox(
//                                           activeColor: checkColor,
//                                           checkColor: Colors.white,
//                                           value: requiredDress,
//                                           onChanged: (value) {
//                                             setState(
//                                               () {
//                                                 requiredDress = value;
//                                                 notRequiredDress = false;
//                                               },
//                                             );
//                                           }),
//                                     ),
//                                     requirementText("Required")
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: width * 0.05,
//                             ),
//                             Material(
//                               borderRadius: BorderRadius.circular(5),
//                               elevation: 5,
//                               child: Container(
//                                 padding: EdgeInsets.only(right: 10),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       height: height * 0.04,
//                                       child: Checkbox(
//                                           activeColor: checkColor,
//                                           checkColor: Colors.white,
//                                           value: notRequiredDress,
//                                           onChanged: (value) {
//                                             setState(() {
//                                               notRequiredDress = value;
//                                               requiredDress = false;
//                                             });
//                                           }),
//                                     ),
//                                     requirementText("Not Required"),
//                                     SizedBox(
//                                       height: height * 0.01,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     if (requiredDress == true) ...[
//                       Row(
//                         children: [
//                           requirementText("Length"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "Length"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           requirementText("Width"),
//                           SizedBox(
//                             width: width * 0.015,
//                           ),
//                           requirementTextField(
//                               height, width, 0.04, 0.15, "Width"),
//                           valueContainer(height, width, size, 0.04, 0.05),
//                           SizedBox(
//                             width: width * 0.15,
//                           ),
//                           Row(
//                             children: [
//                               requirementText("help"),
//                               IconButton(
//                                   padding: EdgeInsets.all(5),
//                                   constraints: BoxConstraints(),
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.help,
//                                     size: height * 0.03,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: height * 0.01,
//                       ),
//                       Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: requirementText("Dress Facility"),
//                           ),
//                           SizedBox(
//                             height: height * 0.01,
//                           ),
//                           requirementTextField(height, width, 0.04, 1, "more")
//                         ],
//                       )
//                     ],
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     SizedBox(height: height * 0.01),
//                     Material(
//                       elevation: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         color: Colors.white,
//                         child: SizedBox(
//                           width: width * 9,
//                           height: height * 0.3,
//                           child: FutureBuilder(
//                               future: getRecent(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Container(
//                                     child: const Center(
//                                       child: CircularProgressIndicator(),
//                                     ),
//                                   );
//                                 } else {
//                                   return CarouselSlider.builder(
//                                     itemCount: bunglowPageRecentList.length,
//                                     itemBuilder: (context, i, id) {
//                                       return Container(
//                                         height: height * 0.4,
//                                         width: width * 0.9,
//                                         child: Image.network(
//                                           imageUrl +
//                                               bunglowPageRecentList[i]
//                                                   ["img_path"],
//                                           fit: BoxFit.fill,
//                                         ),
//                                       );
//                                     },
//                                     options: CarouselOptions(
//                                       autoPlay: true,
//                                       enableInfiniteScroll: true,
//                                       autoPlayAnimationDuration:
//                                           const Duration(milliseconds: 800),
//                                       viewportFraction: 1,
//                                     ),
//                                   );
//                                 }
//                               }),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Material(
//                       elevation: 5,
//                       child: Container(
//                         margin: EdgeInsets.all(10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Material(
//                               elevation: 3,
//                               child: Container(
//                                 margin: EdgeInsets.all(5),
//                                 child: Row(
//                                   children: const [
//                                     Icon(Icons.cloud_upload),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text("Upload a stair image"),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: width * 0.2,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               color: buttonColor,
//                               child: const Text(
//                                 "Preview",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: requirementText("Room Facility"),
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     requirementTextField(
//                         height, width, .04, .8, "other requirement"),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Material(
//                       elevation: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         color: Colors.white,
//                         child: SizedBox(
//                           width: width * 9,
//                           height: height * 0.3,
//                           child: FutureBuilder(
//                               future: getRecent(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Container(
//                                     child: const Center(
//                                       child: CircularProgressIndicator(),
//                                     ),
//                                   );
//                                 } else {
//                                   return CarouselSlider.builder(
//                                     itemCount: bunglowPageRecentList.length,
//                                     itemBuilder: (context, i, id) {
//                                       return Container(
//                                         height: height * 0.4,
//                                         width: width * 0.9,
//                                         child: Image.network(
//                                           imageUrl +
//                                               bunglowPageRecentList[i]
//                                                   ["img_path"],
//                                           fit: BoxFit.fill,
//                                         ),
//                                       );
//                                     },
//                                     options: CarouselOptions(
//                                       autoPlay: true,
//                                       enableInfiniteScroll: true,
//                                       autoPlayAnimationDuration:
//                                           const Duration(milliseconds: 800),
//                                       viewportFraction: 1,
//                                     ),
//                                   );
//                                 }
//                               }),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ]);
//   }
// }

// class DropDown extends StatefulWidget {
//   var width;
//   var height;
//   var w;
//   var h;
//   List<String>? drop;
//   String? selectedDrop;
//   DropDown(
//       this.width, this.height, this.drop, this.selectedDrop, this.w, this.h);
//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: widget.width * 0.02,
//         ),
//         Material(
//           elevation: 5,
//           borderRadius: BorderRadius.circular(5),
//           child: Container(
//             height: widget.height * widget.h,
//             width: widget.width * widget.w,
//             margin: const EdgeInsets.all(
//               3,
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                   icon: const Visibility(
//                       visible: false, child: Icon(Icons.arrow_downward)),
//                   value: widget.selectedDrop,
//                   elevation: 16,
//                   items: widget.drop
//                       ?.map(
//                         (it) => DropdownMenuItem<String>(
//                             value: it,
//                             child: Text(
//                               it,
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             )),
//                       )
//                       .toList(),
//                   onChanged: (it) => setState(() => widget.selectedDrop = it!)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ///form validator
// //   bool validate() {
// //     var valid = form.currentState!.validate();
// //     if (valid) form.currentState!.save();
// //     return valid;
// //   }
// // }

// class EmptyState extends StatelessWidget {
//   final String? title, message;
//   EmptyState({this.title, this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(16),
//       elevation: 16,
//       color: Theme.of(context).cardColor.withOpacity(.95),
//       shadowColor: Theme.of(context).accentColor.withOpacity(.5),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               title!,
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(message!),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
