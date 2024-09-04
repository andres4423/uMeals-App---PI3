import 'dart:math';

import 'package:flutter/material.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:palette_generator/palette_generator.dart';

class BusinessCard extends StatefulWidget {
  final BusinessModel business;
  final double altura;

  const BusinessCard({
    super.key,
    required this.altura,
    required this.business,
  });

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  Color _dominantColor = Colors.transparent;
  bool _iconStatus = false; 
  Color _iconColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _updatePalette();
    _updateIconStatus();
  }

    Future<void> _updateIconStatus() async {
      if (widget.business.estado == 0) {
        _iconColor = Colors.red;
      } else if (widget.business.estado == 1) {
        _iconStatus = true;
        await _animateIcon();
      }
    }

    Future<void> _animateIcon() async {
      while (_iconStatus) {
        _iconColor = Colors.white;
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 500));
        _iconColor = Colors.green.shade500;
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.business.portadaImgURL),
    );
    setState(() {
      _dominantColor = paletteGenerator.dominantColor?.color ?? Colors.black;
      if (_dominantColor.computeLuminance() > 0.5) {
        final random = Random();
        int randomIndex = random.nextInt(5);

        List<Color> colorOptions = [
          Colors.blue[900]!,
          Colors.deepOrange[900]!,
          Colors.purple[900]!,
          Colors.green[900]!,
          Colors.brown[900]!,
        ];

        _dominantColor = colorOptions[randomIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.altura >= 300) {
      return Container(
        height: widget.altura,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(widget.business.portadaImgURL),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [_dominantColor, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.business.nombre,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      )),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        widget.business.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 100,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                color: _dominantColor.withAlpha((_dominantColor.alpha * 0.9).toInt()),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _dominantColor.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  widget.business.descripcion,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 16,
              child:
                CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.business.logotipoImgUrl),
                ),
            ),
            Positioned(
              bottom: 8,
              right: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.compass_calibration_rounded, color: _iconColor),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border, color: Colors.white),
                    padding: EdgeInsets.zero, // Elimina cualquier padding interno del botón
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: widget.altura,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(widget.business.portadaImgURL),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [_dominantColor, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.business.nombre,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      )),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        widget.business.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 16,
              right: 120,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                color: _dominantColor.withAlpha((_dominantColor.alpha * 0.9).toInt()),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  widget.business.descripcion,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 16,
              child:
                CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.business.logotipoImgUrl),
                ),
            ),
            Positioned(
              bottom: 8,
              right: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.compass_calibration_rounded, color: _iconColor),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border, color: Colors.white),
                    padding: EdgeInsets.zero, // Elimina cualquier padding interno del botón
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
