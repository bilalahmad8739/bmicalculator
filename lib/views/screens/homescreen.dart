import 'package:bmicalculator_provider/core/providers/bmiprovider.dart';
import 'package:bmicalculator_provider/core/services/calculation.dart';
import 'package:bmicalculator_provider/core/services/toastutilise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  // final heightcontroller = TextEditingController();
  // final weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<BmiProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<BmiProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter height';
                              }
                              return null;
                            },
                            controller: provider.heightcontroller,
                            decoration: const InputDecoration(
                                hintText: 'Enter height in cm ',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              return null;
                            },
                            controller: provider.weightcontroller,
                            decoration: const InputDecoration(
                                hintText: 'Enter weight in kg',
                                border: OutlineInputBorder()),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // setState(() {});
                      // var bmiResult = provider.result.toString();
                      // var statusResult = BmiProvider.status.toString();
                      // ToastUtilse.showToast('Your Bmi is : $bmiResult\n' +
                      //     'Your status is : $statusResult');
                      if (_formKey.currentState!.validate()) {}

                      provider.cal();
                      provider.showUtilise('');
                    },
                    child: const Text('calculate'),
                  ),
                  // Text('your Bmi is :${provider.result.toString()}'),
                  // Text('your status is : ${BmiProvider.status.toString()}')
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
