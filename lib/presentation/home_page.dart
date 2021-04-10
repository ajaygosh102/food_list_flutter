import 'package:flutter/material.dart';import 'package:flutter_app_mock/presentation/items.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'bloc/home_bloc_cubit.dart';import 'helper_widgets/circle_progressbar.dart';import 'helper_widgets/ui_helper.dart';class HomePage extends StatefulWidget {  @override  _HomePageState createState() => _HomePageState();}class _HomePageState extends State<HomePage> {  HomeBlocCubit homeBlocCubit = HomeBlocCubit();  @override  void initState() {    super.initState();  }  @override  Widget build(BuildContext context) {    return SafeArea(      child: Scaffold(        backgroundColor: Colors.white,        appBar: AppBar(),        floatingActionButton: FloatingActionButton(onPressed: () {          modalBottomSheet();        }),        body: Container(),      ),    );  }  ///approved food list  void modalBottomSheet() {    var searchController = TextEditingController();    homeBlocCubit.getApprovedFoodList();    showModalBottomSheet(      isScrollControlled: true,      context: context,      builder: (context) => BlocBuilder(        bloc: homeBlocCubit,        builder: (context, state) {          print('state-----------$state');          if (state is ApprovedFoodResponse) {            return Padding(              padding: const EdgeInsets.all(8.0),              child: Column(                mainAxisSize: MainAxisSize.min,                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  verticalSpaceLarge,                  InkWell(                      onTap: () {                        Navigator.pop(context);                      },                      child: Icon(                        Icons.close,                        size: 40,                      )),                  verticalSpaceSmall,                  Text(                    'Approved Foods List',                    style: Theme.of(context).textTheme.headline5,                  ),                  verticalSpaceMedium,                  Container(                    height: 45,                    child: TextField(                      controller: searchController,                      decoration: InputDecoration(                        prefixIcon: Icon(Icons.search),                        hintText: 'Try searching fat, sausage names...',                        hintStyle: Theme.of(context).textTheme.bodyText2,                        border: OutlineInputBorder(                          borderSide: BorderSide(color: Colors.red, width: 5.0),                        ),                      ),                      onChanged: (value) {                        print('searching $value');                        // getSearchValue(value);                      },                    ),                  ),                  verticalSpaceSmall,                  Expanded(                    flex: 8,                    child: getListItem(),                  ),                ],              ),            );          } else if (state is Loading) {            return showCircleProgress();          } else {            return Text('error');          }        },      ),    );  }}///search result// void getSearchValue(String value) {//   List searchResult = [];//   List b;//   GlobalData.approvedFoodModel.categories.asMap().forEach((index1, element1) {//     element1.category.subcategories.asMap().forEach((index2, element2) {//       b = element2.items.where((note) {//         return note.toLowerCase().startsWith(value.toLowerCase());//       }).toList();//       b?.forEach((element) {//         searchResult.add(element);//         print(b);//       });//     });//     print('a------------');////     print(searchResult);//   });// }