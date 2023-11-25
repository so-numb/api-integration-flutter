import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_integration/api_service.dart';
import 'package:api_integration/model.dart';


void main() {
  runApp(const MyApp());
  // fetchData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }
  void _getData()async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value)=>
        setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('API integration'),
          backgroundColor: Colors.pinkAccent.withOpacity(0.9),
        ),

        body: _userModel == null || _userModel!.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.separated(
          itemCount: _userModel!.length,
          itemBuilder: (context, index){
            return ListTile(
              tileColor: Colors.white,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://img.freepik.com/premium-vector/man-avatar-profile-round-icon_24640-14044.jpg?w=2000'),
              ),
              title: Text(
                  '${_userModel![index].name}\n${_userModel![index].author}'
              ),
              subtitle: Text(
                  '${_userModel![index].edition} edition'
              ),
            );
          },
          separatorBuilder: (context, index){
            return const Divider(
              thickness: 2,
            );
          },
        )
    );
  }

}
// Future<void> fetchData() async {
//   final response = await http.get(Uri.parse('http://localhost:8080/trumanblack/allBooks'));
//   if (response.statusCode == 200) {
//     final data = response.body;
//     print(data);
//     // Do something with the data
//   }
// }
