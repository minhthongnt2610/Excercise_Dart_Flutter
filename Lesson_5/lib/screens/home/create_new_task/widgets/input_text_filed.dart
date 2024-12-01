import 'package:flutter/material.dart';

class InputTextFiled extends StatefulWidget {
  const InputTextFiled({
    super.key,
    required this.hint,
    required this.maxLines,
  });
  final String hint;
  final int maxLines;

  @override
  State<InputTextFiled> createState() => _inputTextFiledState();
}
class _inputTextFiledState extends State<InputTextFiled> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 27,
      ),
      child: TextFormField(
        controller: _controller,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        maxLines: widget.maxLines,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            )),
      ),
    );
  }
}
