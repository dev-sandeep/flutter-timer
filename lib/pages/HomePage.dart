import 'package:flutter/material.dart';
import 'package:my_app/forms/TextFieldForm.dart';
import 'package:my_app/forms/Alert.dart';

class HomePage extends StatelessWidget {
  
  HomePage({
     super.key
  });

  final examNameController = TextEditingController();
  final examQuestionsController = TextEditingController();
  final examTimeController = TextEditingController();

  void startSessionClickHandher(BuildContext context){
    //basic validation
    
    if(examNameController.text.isEmpty || examQuestionsController.text.isEmpty || examTimeController.text.isEmpty){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const Alert(title: "Error Occurred", desc: "All fields are mandatory")
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Competitive Timer'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: const Text('Information about this session',
                style: TextStyle(fontSize: 40)),
            padding: EdgeInsets.all(20.0),
          ),
          Flexible(
              child: Row(
            children: [
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextFieldForm(
                    hintText: 'Type session name',
                    labelText: 'Session Name',
                    textController: examNameController,
                  )),
            ],
          )),
          Flexible(
              child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: TextFieldForm(
                  hintText: 'Total questions',
                  labelText: 'No. of questions',
                  textController: examQuestionsController,
                )
              ),
              Flexible(
                child: TextFieldForm(
                  hintText: 'Total time',
                  labelText: 'Time in minutes',
                  textController: examTimeController,
                )
              ),
            ],
          )),
        ],
      ),
      persistentFooterButtons: <Widget>[
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: ()=>startSessionClickHandher(context),
            child: const Text('Start Session ', style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: BorderSide(
                  width: 1.0,
                )),
          ),
        )
      ],
    );
  }
}
