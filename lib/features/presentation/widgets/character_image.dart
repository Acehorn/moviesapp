import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CharacterImage({
    super.key,
    required this.imageUrl,
    this.size = 56,
  });

  bool get _isValidUrl {
    return imageUrl.isNotEmpty && imageUrl.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: _isValidUrl
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _fallbackImage(),
              )
            : _fallbackImage(),
      ),
    );
  }

  Widget _fallbackImage() {
    return Image.asset(
      'assets/futurama_outline.jpg',
      fit: BoxFit.cover,
    );
  }
}
