import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oversize/config/widgets/button_widget.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? cardHolder;
  String? cardNumber;
  String? validDate;
  String? cvv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Payment Methods",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [_buildCardSection()]),
      ),
    );
  }

  Widget _buildCardSection() {
    return Row(
      children: [
        Expanded(
          child: cardNumber != null
              ? _buildCardPreview()
              : Container(
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("No card added"),
                ),
        ),
        SizedBox(width: 8),
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.blue, size: 40),
          onPressed: () {
            _showAddCardSheet();
          },
        ),
      ],
    );
  }

  Widget _buildCardPreview() {
    return GestureDetector(
      onTap: () {
        _showEditCardSheet();
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.credit_card, color: Colors.white, size: 40),
            Spacer(),
            Text(
              cardHolder ?? '',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "**** **** **** ${cardNumber!.substring(cardNumber!.length - 4)}",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(validDate ?? '', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _showAddCardSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Card",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _cardForm(),
              SizedBox(height: 16),
              ButtonWidget(
                onPressed: () {
                  if (cardNumber == null || cardNumber!.length != 16) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Karta raqam 16 ta sondan kam bolmasligi kerak",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return; // To‘xtatish
                  }

                  if (validDate == null || validDate!.length != 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Iltimos togri formatda kiriting (MM/YY)",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (cvv == null || cvv!.length != 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("CVV 3ta sondan iborat bolsh lozim"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  setState(() {});
                  Navigator.pop(context);
                },
                text: "save".tr(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditCardSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Card",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        cardHolder = null;
                        cardNumber = null;
                        validDate = null;
                        cvv = null;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              _cardForm(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Text("Save Changes"),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _cardForm() {
    final holderController = TextEditingController(text: cardHolder);
    final numberController = TextEditingController(text: cardNumber);
    final validController = TextEditingController(text: validDate);
    final cvvController = TextEditingController(text: cvv);

    return Column(
      children: [
        TextField(
          controller: holderController,
          decoration: InputDecoration(labelText: "Card Holder"),
          onChanged: (v) => cardHolder = v,
        ),
        TextField(
          controller: numberController,
          decoration: InputDecoration(labelText: "Card Number"),
          keyboardType: TextInputType.number,
          onChanged: (v) => cardNumber = v,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: validController,
                decoration: InputDecoration(labelText: "Valid Date"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                  CardDateInputFormatter(),
                ],
                onChanged: (v) => validDate = v,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: cvvController,
                decoration: InputDecoration(labelText: "CVV"),
                keyboardType: TextInputType.number,
                onChanged: (v) => cvv = v,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll('/', '');

    if (text.length >= 3) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
