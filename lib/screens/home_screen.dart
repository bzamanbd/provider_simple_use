import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_screen_provider.dart';
class HomeScreen extends StatefulWidget {
  final String title;
  
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<HomeScreenProvider>(
      create: (context)=>HomeScreenProvider(),
      child: Builder(builder: (context){
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<HomeScreenProvider>(builder: (context,myProvider,child){
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 8,
                      width: size.width / 8,
                      decoration: BoxDecoration(
                          color:myProvider.isEligible? Colors.green : Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                    ),
                    SizedBox(height: size.height / 30),
                    TextField(
                      controller: ageController,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                      ),
                      cursorColor: Colors.green,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Age here',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: size.height / 30),
                     Text(myProvider.message,style: TextStyle(
                       color: myProvider.isEligible? Colors.green: Theme.of(context).primaryColor,
                      fontWeight: myProvider.isEligible?FontWeight.bold:FontWeight.normal,
                     ),
                        textScaleFactor: 1.3),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                        final int age = int.parse(ageController.text.trim());
                        myProvider.eligibilityChecker(age);

                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 26.0),
                          child: Text('Check Me', textScaleFactor: 1.4),
                        )),
                  ],
                );
                })
              ),
            ),
          ),
        );
      }),
      );
  }
}