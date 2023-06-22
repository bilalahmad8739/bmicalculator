import 'package:bmicalculator_provider/providers/bmiprovider.dart';
import 'package:bmicalculator_provider/services/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final heightcontroller = TextEditingController();
  // final weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<BmiProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<BmiProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                TextField(
                  controller: provider.heightcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter value in height',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: provider.weightcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter value in weight',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.cal();

                    // setState(() {});
                  },
                  child: Text('calculate'),
                ),
                Text('your Bmi is :${provider.result.toString()}'),
                Text('your status is : ${BmiProvider.status.toString()}')
              ],
            );
          },
        ),
      ),
    );
  }
}
