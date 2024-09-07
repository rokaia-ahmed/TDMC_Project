import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Spacer(),
          Center(child: CircularProgressIndicator()),
          Spacer(),
        ],
      ),
    );
  }
}
class CustomLoading2 extends StatelessWidget {
  const CustomLoading2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Center(child: CircularProgressIndicator()),
        Spacer(),
      ],
    );
  }
}
class CustomLoading3 extends StatelessWidget {
  const CustomLoading3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.17,
        ),
        Center(child: CircularProgressIndicator()),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.17,
        ),
      ],
    );
  }
}
