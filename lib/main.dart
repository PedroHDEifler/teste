import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Página Flutter',
      theme: ThemeData(
        primaryColor: Color(0xFF3456AB),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF3456AB),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF3456AB),
            onPrimary: Colors.white,
            shadowColor: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Pagina1(),
        '/p2': (context) => Pagina2(),
        '/p3': (context) => Pagina3(
              enteredSalary: '',
            ),
      },
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cálculo de Imposto de Renda')),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.ETBz1DbDFGPcf5vbFBUq-gHaEo?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao Nosso Sistema!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Nosso objetivo é te ajudar com suas contas!',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/p2');
                },
                child: Text('COMEÇAR'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  TextEditingController _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONSULTA DE DADOS'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.ETBz1DbDFGPcf5vbFBUq-gHaEo?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Informe seu salário mensal:',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Digite o salário',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white24,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String enteredSalary = _salaryController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Pagina3(enteredSalary: enteredSalary),
                      ),
                    );
                  },
                  child: Text('Confirmar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Pagina3 extends StatelessWidget {
  final String enteredSalary;

  Pagina3({required this.enteredSalary});

  @override
  Widget build(BuildContext context) {
    double salary = double.tryParse(enteredSalary) ?? 0.0;

    double tax = 0.0;
    String resultText = '';

    if (salary < 1904) {
      tax = 0.0;
      resultText = 'Imposto a pagar: R\$0';
    } else if (salary >= 1904 && salary < 2827) {
      tax = salary * 0.075 - 142;
      resultText = 'Imposto a pagar: R\$$tax';
    } else if (salary >= 2827 && salary < 3752) {
      tax = salary * 0.15 - 354;
      resultText = 'Imposto a pagar: R\$$tax';
    } else if (salary >= 3752 && salary < 4665) {
      tax = salary * 0.225 - 636;
      resultText = 'Imposto a pagar: R\$$tax';
    } else {
      tax = salary * 0.275 - 869;
      resultText = 'Imposto a pagar: R\$$tax';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTADOS'),
      ),
      body: Stack(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quarto');
            },
            child: Text('FINAL'),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.ETBz1DbDFGPcf5vbFBUq-gHaEo?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Obrigado por usar nosso sistema!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  resultText,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
