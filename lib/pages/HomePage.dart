import 'package:flutter/material.dart';
import 'package:my_app/utils/TextFieldForm.dart';
import 'package:my_app/utils/Alert.dart';
import 'package:my_app/pages/TimerPage.dart';

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
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TimerPage()));
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
            padding: const EdgeInsets.all(20.0),
            child: const Text('Information about this session',
                style: TextStyle(fontSize: 40)),
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
          child: ElevatedButton(
            onPressed: ()=>startSessionClickHandher(context),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: const BorderSide(
                  width: 1.0,
                )),
            child: const Text('Start Session ', style: TextStyle(fontSize: 20)),
          ),
        )
      ],
    );
  }
}
