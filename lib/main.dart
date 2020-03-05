import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(
    ),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController ();
  TextEditingController alturaController = TextEditingController ();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seu Dados!";

void _resetFilds(){
pesoController.text = "";
alturaController.text = "";
setState(() {
_infoText = "Informe seus Dados!";  
});

}
//função que calcula o IMC
void _calculate(){
  setState(() {
   double peso = double.parse(pesoController.text);
   double altura = double.parse(alturaController.text) / 100;
   double imc = peso / (altura * altura);
if(imc <18.6){
  _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
  } else if(imc >= 18.6 && imc < 24.9){
  _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
  } else if(imc >= 24.9 && imc < 29.9){
  _infoText = "Levemente Acima do peso (${imc.toStringAsPrecision(3)})";
  } else if(imc >= 29.9 && imc < 34.9){
  _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
  } else if(imc >= 34.9 && imc < 39.9){
  _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
  } else if(imc >= 40.0){
  _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
  }
  
  });

}
//Corpo do APP
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
           onPressed: _resetFilds
           )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
         child: Form(
           key: _formKey,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline, size: 120.0, color: Colors.grey),
          TextFormField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (Kg)",
            labelStyle: TextStyle(color: Colors.black, fontSize: 25.0)
          ), 
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors. black, fontSize: 25.0,),
          controller: pesoController,
          validator: (Value){
            if(Value.isEmpty){
              return "Insira seu Peso";
          }
          }
          ),
          TextFormField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura (cm)",
            labelStyle: TextStyle(color: Colors.black, fontSize: 25.0,),
          ), 
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors. black, fontSize: 25.0,),
          controller: alturaController,
          validator: (Value){
            if(Value.isEmpty){
              return "Insira sua Altura";
          }
          }
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
            height: 50.0,
            child:RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  _calculate();
                }
              },
          child: Text('Calcular',
          style: TextStyle(color: Colors.white, fontSize: 25.0),), 
          color: Colors. grey,
          ),
        ),
      ),
          Text(
            _infoText,
        textAlign:TextAlign.center,
        style: TextStyle(color: Colors. black, fontSize: 25.0),
      ),
        ],
      ),)
      )
    );
  }
}