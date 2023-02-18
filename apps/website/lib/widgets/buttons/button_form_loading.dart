import 'package:flutter/material.dart';

/// Button for Form with loading
class ButtonFormLoadingWidget extends StatelessWidget {
  const ButtonFormLoadingWidget({
    super.key,
    required this.text,
    required this.loading,
    required this.onTap,
  });

  final String text;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onTap,
      child: loading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
    );
  }
}
