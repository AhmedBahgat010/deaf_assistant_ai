import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KeyPad extends StatefulWidget {
  final Function(String value) onChanged;

  const KeyPad({
    super.key,
    required this.onChanged,
  });

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  static const _backspace = 'backspace';
  static const _decimalPoint = '.';

  String _value = '0';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Row(
            children: [
              _buildKey(value: '1'),
              _buildKey(value: '2'),
              _buildKey(value: '3'),
            ],
          ),
          Row(
            children: [
              _buildKey(value: '4'),
              _buildKey(value: '5'),
              _buildKey(value: '6'),
            ],
          ),
          Row(
            children: [
              _buildKey(value: '7'),
              _buildKey(value: '8'),
              _buildKey(value: '9'),
            ],
          ),
          Row(
            children: [
              _buildKey(value: _decimalPoint),
              _buildKey(value: '0'),
              _buildKey(
                value: _backspace,
                customChild: const Icon(
                  Iconsax.arrow_left,
                  color: AppColors.black,
                  size: 31,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKey({required String value, Widget? customChild}) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _onKeyPressed(value),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: customChild ??
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
          ),
        ),
      ),
    );
  }

  void _onKeyPressed(String key) {
    setState(() {
      if (_value == '0' && (key == _decimalPoint || key == _backspace)) {
        return;
      }

      if (key == _decimalPoint && _value.contains('.')) {
        return;
      }

      if (key == _backspace && _value.length == 1) {
        _value = '0';
        widget.onChanged(_value);
        return;
      }

      if (key == _backspace) {
        _value = _value.substring(0, _value.length - 1);
        widget.onChanged(_value);
        return;
      }

      _value = _value == '0' ? key : _value + key;
      widget.onChanged(_value);
    });
  }
}
