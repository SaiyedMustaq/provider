import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//git add
import 'EligiblityScreenProvider.dart';

class SimpleProvider extends StatelessWidget {
  SimpleProvider({Key? key}) : super(key: key);

  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligiblityScreenProvider>(
      create: (context) => EligiblityScreenProvider(),
      builder: (context, child) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Consumer<EligiblityScreenProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: value.isEligible ? Colors.green : Colors.red,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Give your age",
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: const Text("Check"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        value.checkEligiblity(int.parse(ageController.text));
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("You have not given any input")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
