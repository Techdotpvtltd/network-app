// Project: 	   friendzoned
// File:    	   text_widget
// Path:    	   lib/components/text_widget.dart
// Author:       Ali Akbar
// Date:        10-08-24 11:05:51 -- Saturday
// Description:

import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _InterTextWidget extends StatelessWidget {
  const _InterTextWidget(
    this.str, {
    this.color,
    this.size,
    this.weight,
    this.maxLines,
    this.textOverflow,
    this.align,
    this.textDecoration,
  });
  final String str;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: align,
      style: GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: textDecoration,
        decorationColor: color,
      ),
    );
  }
}

class _MontserratTextWidget extends StatelessWidget {
  const _MontserratTextWidget(
    this.str, {
    this.color,
    this.size,
    this.weight,
    this.maxLines,
    this.textOverflow,
    this.align,
    this.textDecoration,
  });
  final String str;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: align,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: textDecoration,
      ),
    );
  }
}

class SecondaryTitleText extends StatelessWidget {
  const SecondaryTitleText(this.str,
      {super.key,
      this.color,
      this.size,
      this.weight,
      this.maxLines,
      this.textOverflow,
      this.align,
      this.textDecoration});
  final String str;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return _MontserratTextWidget(
      str,
      textOverflow: textOverflow,
      align: align,
      maxLines: maxLines,
      color: color ?? const Color(0xFF25131A),
      size: size ?? 34,
      weight: weight ?? FontWeight.w700,
      textDecoration: textDecoration,
    );
  }
}

class PrimaryTitleText extends StatelessWidget {
  const PrimaryTitleText(this.str,
      {super.key,
      this.color,
      this.size,
      this.weight,
      this.maxLines,
      this.textOverflow,
      this.align,
      this.textDecoration});
  final String str;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return _InterTextWidget(
      str,
      align: align,
      maxLines: maxLines,
      textOverflow: textOverflow,
      color: color ?? AppTheme.titleColor1,
      size: size ?? 26,
      weight: weight ?? FontWeight.w700,
      textDecoration: textDecoration,
    );
  }
}

class PrimaryText extends StatelessWidget {
  const PrimaryText(this.str,
      {super.key,
      this.color,
      this.size,
      this.weight,
      this.maxLines,
      this.textOverflow,
      this.align,
      this.textDecoration});
  final String str;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return _InterTextWidget(
      str,
      maxLines: maxLines,
      align: align,
      textOverflow: textOverflow,
      color: color ?? const Color(0xFF505050),
      size: size ?? 14,
      weight: weight ?? FontWeight.w400,
      textDecoration: textDecoration,
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.str,
      {super.key,
      this.color,
      this.size,
      this.weight,
      this.maxLines,
      this.textOverflow,
      this.align,
      this.textDecoration});
  final String str;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return _MontserratTextWidget(
      str,
      textOverflow: textOverflow,
      align: align,
      maxLines: maxLines,
      color: color ?? const Color(0xFF494949),
      size: size ?? 14,
      weight: weight ?? FontWeight.w400,
      textDecoration: textDecoration,
    );
  }
}
