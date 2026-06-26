import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Conversor()
    );
  }
}

class Conversor extends StatefulWidget{
  const Conversor({super.key});

  @override
  State<Conversor> createState(){
    return ConversorState();
  }
}

class ConversorState extends State<Conversor> {
  final tempcontroller = TextEditingController();

  String resultado = '';
  String temp1 = 'C';
  String temp2 = 'C';

  void definirTemperatura(int num, String tipo){
    if(num == 1){
      setState(() {
        temp1 = tipo;
      });
    } else {
      setState(() {
        temp2 = tipo;
      });
    }
  }

  void calcular(){
    double valor = double.parse(tempcontroller.text);

    if(temp1 == temp2){
      setState(() {
        resultado = valor.toString();
      });
      return;
    }

    if(temp1 == 'C' && temp2 == 'F'){
      setState(() {
        resultado = ((valor * 1.8) + 32).toString();
      });
    } else {
      setState(() {
        resultado = ((valor - 32) / 1.8).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor de Temperatura'), backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha o tipo de temperatura que será convertido'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => definirTemperatura(1, 'C'), child: Text('C°')),
                ElevatedButton(onPressed: () => definirTemperatura(1, 'F'), child: Text('F°'))
              ],
            ),
            TextField(controller: tempcontroller, decoration: InputDecoration(hintText: 'Digite o valor para converter'), textAlign: TextAlign.center,),
            Text('Escolha o tipo de temperatura que quer receber'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => definirTemperatura(2, 'C'), child: Text('C°')),
                ElevatedButton(onPressed: () => definirTemperatura(2, 'F'), child: Text('F°'))
              ],
            ),
            ElevatedButton(onPressed: () => calcular(), child: Text('Calcular')),
            Text(resultado)
          ],
        ),
      ),
    );
  }
}