import 'package:flutter/material.dart';
import 'package:goatmitra/controllers/mlpost.dart';
import 'package:goatmitra/view/widgets/save_and_open_pdf.dart';
import 'package:goatmitra/view/widgets/simple_pdf_api.dart';

class HealthCheckPage extends StatefulWidget {
  final name;
  const HealthCheckPage({super.key,required this.name});

  @override
  State<HealthCheckPage> createState() => _HealthCheckPageState();
}

class _HealthCheckPageState extends State<HealthCheckPage> {
  @override
  Widget build(BuildContext context) {
    final name=widget.name;
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController feverController = TextEditingController();
    TextEditingController runningNoseController = TextEditingController();
    TextEditingController lathargicController = TextEditingController();
    TextEditingController diarrheaController = TextEditingController();
    TextEditingController coughingController = TextEditingController();
    TextEditingController coatController = TextEditingController();
    String res="";
    bool isLoading=false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Diagnosis'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: weightController,
                      decoration: const InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Weight'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: heightController,
                      decoration: const InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Height'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: feverController,
                      decoration: const InputDecoration(border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),labelText: 'Does the goat have a fever?'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
            
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: runningNoseController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Does the goat have a running nose?'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: lathargicController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Is the goat lathargic?'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: diarrheaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Does the goat have Diarrhea?'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: coughingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Is the goat coughing/sneezing?'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),      
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: coatController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                        labelText: 'Has the goat shown changes in its coat?'
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading=true;
                            });
                            final simplePdfApi = SimplePdfApi();
                            
                            final simplePdfFile = await simplePdfApi.generateSimpleTextPdf(name: name, weight: weightController.text, height: heightController.text, fever: feverController.text, nose: runningNoseController.text, lathargic: lathargicController.text, diarrhea: diarrheaController.text, sneezing: coughingController.text, coatChange: coatController.text);
                            setState(() {
                              isLoading=false;
                            });
                            SaveAndOpenDocument.openPDF(simplePdfFile);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.black
                          ),
                          child: const Text('Generate Health Card',style: TextStyle(color: Colors.white),),
                        ),
                        const SizedBox(height: 20.0),
                       ElevatedButton(
  onPressed: () async {
    setState(() {
      isLoading = true;
    });
    String result = await Http.post(
      weight: weightController.text,
      height: heightController.text,
      fever: feverController.text,
      lethargy: lathargicController.text,
      diarrhea: diarrheaController.text,
      runningNose: runningNoseController.text,
      coughingSneezing: coughingController.text,
      coatChanges: coatController.text
    );
    setState(() {
      res = result;
      isLoading = false;
    });
  },
  style: ElevatedButton.styleFrom(
    backgroundColor:  Colors.black
  ),
  child: const Text('Predict Health',style: TextStyle(color: Colors.white),),
),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 500,
               child:Text(res,style: const TextStyle(color: Colors.black),)
            )
          ],
        ),
      ),
    );
  }
}
