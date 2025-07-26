import 'package:flutter/material.dart';

class PinSetupScreen extends StatefulWidget {
  PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final List<String> _input = [];

  void _addDigit(String digit) {
    if (_input.length < 4) {
      setState(() {
        _input.add(digit);
      });
    }
  }

  void _removeDigit() {
    if (_input.isNotEmpty) {
      setState(() {
        _input.removeLast();
      });
    }
  }

  void _verifyPin() {
    // PIN tekshirish joyi
    String enteredPin = _input.join();
    if (enteredPin == "1234") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("PIN to‘g‘ri!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("PIN noto‘g‘ri!")));
      setState(() {
        _input.clear();
      });
    }
  }

  Widget _buildPinCircle(int index) {
    bool filled = index < _input.length;
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? Colors.black : Colors.transparent,
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () {
        _addDigit(number);
        if (_input.length == 4) {
          _verifyPin();
        }
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF7F9FC),
        ),
        alignment: Alignment.center,
        child: Text(
          number,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: _removeDigit,
      child: const Icon(Icons.backspace_outlined, size: 30, color: Colors.red),
    );
  }

  Widget _buildFingerprintButton() {
    return GestureDetector(
      onTap: () {
        // Barmoq izi ishlashi
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Fingerprint bosildi")));
      },
      child: const Icon(Icons.fingerprint, size: 36, color: Colors.teal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(Icons.lock, size: 40, color: Colors.teal),
            const SizedBox(height: 16),
            const Text(
              "PIN-kod",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "PIN-kodni kiriting",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, _buildPinCircle),
            ),

            Expanded(
              child: Column(
                spacing: 10,
                children: [
                  for (var row in [
                    ['1', '2', '3'],
                    ['4', '5', '6'],
                    ['7', '8', '9'],
                    ['←', '0', 'fingerprint'],
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: row.map((item) {
                        if (item == '←') return _buildBackspaceButton();
                        if (item == 'fingerprint')
                          return _buildFingerprintButton();
                        return _buildNumberButton(item);
                      }).toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
