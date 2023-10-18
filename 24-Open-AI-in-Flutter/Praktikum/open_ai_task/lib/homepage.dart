import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey = '';

  TextEditingController kebutuhan = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController sistemOperasi = TextEditingController();
  String gptOutput = '';
  bool isLoading = false;

  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            const Text("Flutter with OpenAI", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 35),
          child: Column(
            children: [
              const Text(
                'Masukkan kriteria laptop yang diinginkan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              txtField(
                  kebutuhan, 'Kebutuhan Laptop', 'Gaming', TextInputType.text),
              txtField(budget, 'Budget', '5000000', TextInputType.number),
              txtField(sistemOperasi, 'Sistem Operasi', 'iOS/Windows',
                  TextInputType.text),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text('Submit'),
                ),
              ),
              const Text('Rekomendasi Merk Laptop:'),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black26),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: MediaQuery.of(context).size.height - 550,
                width: MediaQuery.of(context).size.width,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Text(gptOutput, textAlign: TextAlign.start),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        data: {
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content':
                  'Anda adalah seorang ahli dalam memberikan rekomendasi merk laptop berdasarkan kebutuhan, budget, dan sistem operasi.'
            },
            {
              'role': 'user',
              'content':
                  'Berikan saya rekomendasi merk laptop dengan kebutuhan ${kebutuhan.text}, budget sekitar ${budget.text}, dan sistem operasi ${sistemOperasi.text}.'
            },
          ],
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          gptOutput = data['choices'][0]['message']['content'];
        });
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget txtField(TextEditingController controller, String label, String hint,
      TextInputType kboardType) {
    return TextField(
      controller: controller,
      keyboardType: kboardType,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
