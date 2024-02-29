import 'package:flutter/material.dart';
import 'package:quiz_app/app/model/quiz_model.dart';
import 'package:quiz_app/icons/resuit_icon.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class BashkyBarakcha extends StatefulWidget {
  const BashkyBarakcha({super.key});

  @override
  State<BashkyBarakcha> createState() => _BashkyBarakchaState();
}

class _BashkyBarakchaState extends State<BashkyBarakcha> {
  int index = 0;

  List<bool> jooptor = [];
  List<bool> tuupajoop = [];
  List<bool> katajoop = [];

  void teksher(bool value) {
    if (quizzes[index].answer == value) {
      jooptor.add(true);
      tuupajoop.add(true);
    } else {
      jooptor.add(false);
      katajoop.add(false);
    }
    setState(() {
      if (quizzes[index] == quizzes.last) {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: const Text('тест аяктады!!!'),
                  content: Text(
                    'суроолордун саны: ${jooptor.length}\n'
                    'Туура жооптордун саны: ${tuupajoop.length}\n'
                    'ката жооптордун саны: ${katajoop.length}\n',
                  ),
                  actions: <Widget>[
                    TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Тестти кайра баштоо'),
                        onPressed: () {
                          setState(() {
                            index = 0;
                            jooptor.clear();
                            tuupajoop.clear();
                            katajoop.clear();
                            Navigator.of(context).pop();
                          });
                        }),
                  ]);
            });
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тапшырма 7'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff363636),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Text(
              quizzes[index].question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          const Spacer(),
          CustomButton(
            tuuraButtonbu: true,
            baskanda: (value) {
              teksher(value);
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            tuuraButtonbu: false,
            baskanda: (maani) {
              teksher(maani);
            },
          ),
          const SizedBox(height: 50),
          // const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: jooptor.length,
              itemBuilder: (context, index) {
                return jooptor[index] == true
                    ? const ResultIcon(tuuraIconbu: true)
                    : const ResultIcon(tuuraIconbu: false);
              },
            ),
          )
        ]),
      ),
    );
  }
}
