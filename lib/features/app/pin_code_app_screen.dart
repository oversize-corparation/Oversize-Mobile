import 'package:flutter/material.dart';
import 'package:oversize/core/services/local_storage.dart';

class PinCodeAppScreen extends StatefulWidget {
  const PinCodeAppScreen({super.key});

  @override
  State<PinCodeAppScreen> createState() => _PinCodeAppScreenState();
}

class _PinCodeAppScreenState extends State<PinCodeAppScreen> {
  String enteredPin = '';
  bool isPinVisible = false;

  Future<void> _checkPin() async {
    final savedPin = await LocalStorage.getSavedPin();
    if (enteredPin == savedPin) {
      Navigator.pushReplacementNamed(context, '/home'); // yoki HomeScreen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Noto‘g‘ri PIN!')),
      );
      setState(() => enteredPin = '');
    }
  }

  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 4) {
              enteredPin += number.toString();
              if (enteredPin.length == 4) {
                Future.microtask(() => _checkPin());
              }
            }
          });
        },
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'PIN kiriting',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 40),

            /// Pin dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.all(6),
                  width: isPinVisible ? 50 : 16,
                  height: isPinVisible ? 50 : 16,
                  decoration: BoxDecoration(
                    color: index < enteredPin.length
                        ? (isPinVisible ? Colors.green : Colors.blue)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: isPinVisible && index < enteredPin.length
                      ? Center(
                          child: Text(
                            enteredPin[index],
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      : null,
                );
              }),
            ),

            IconButton(
              onPressed: () => setState(() => isPinVisible = !isPinVisible),
              icon: Icon(isPinVisible ? Icons.visibility_off : Icons.visibility),
            ),

            /// Digits
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (j) => numButton(1 + i * 3 + j)),
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 70),
                  numButton(0),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (enteredPin.isNotEmpty) {
                          enteredPin = enteredPin.substring(0, enteredPin.length - 1);
                        }
                      });
                    },
                    icon: const Icon(Icons.backspace),
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
