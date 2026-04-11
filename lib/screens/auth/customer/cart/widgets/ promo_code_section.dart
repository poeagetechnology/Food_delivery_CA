import 'package:flutter/material.dart';

class PromoCodeSection extends StatefulWidget {
  const PromoCodeSection({super.key});

  @override
  State<PromoCodeSection> createState() => _PromoCodeSectionState();
}

class _PromoCodeSectionState extends State<PromoCodeSection> {

  final TextEditingController controller = TextEditingController();
  String message = "";

  void applyCode() {
    if (controller.text == "SAVE10") {
      setState(() {
        message = "Coupon Applied 🎉";
      });
    } else {
      setState(() {
        message = "Invalid Code ❌";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Enter Promo Code",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              ElevatedButton(
                onPressed: applyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text("Apply"),
              )
            ],
          ),

          const SizedBox(height: 5),

          Text(
            message,
            style: const TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }
}