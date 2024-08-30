import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MasukkanNilai(),
  ));
}

class MasukkanNilai extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  String classifyGrade(int score) {
    if (score >= 85) return 'A';
    if (score >= 70) return 'B';
    if (score >= 55) return 'C';
    return 'D';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan nilai',
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final int? score = int.tryParse(_controller.text);
                final String result = (score != null)
                    ? 'Kategori: ${classifyGrade(score)}'
                    : 'Masukkan nilai yang valid';

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(result),
                  ),
                );
              },
              child: Text('Hitung Nilai'),
            ),
          ],
        ),
      ),
    );
  }
}
