import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/text_widget.dart';
import '../../utils/constants/app_theme.dart';
import '../../utils/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.titleText,
    required this.hintText,
    this.controller,
    this.suffixWidget,
    this.onTFTap,
    this.errorText,
    this.isReadyOnly = false,
    this.keyboardType,
    this.prefixWidget,
    this.maxLines = 1,
    this.minLines,
    this.fieldId,
    this.errorCode,
    this.onSubmitted,
    this.onChange,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
  });
  final String? titleText;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final VoidCallback? onTFTap;
  final String? errorText;
  final bool isReadyOnly;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? minLines;
  final int? fieldId;
  final int? errorCode;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  final TextInputAction? textInputAction;
  final String? prefixIcon;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isReadOnly;
  bool isFocused = false;
  late final FocusNode textFieldFocus;
  bool isShowPassword = true;

  IconData? getTextFiledPrefixIcon() {
    switch (widget.keyboardType) {
      case TextInputType.emailAddress:
        return Icons.email;
      case TextInputType.visiblePassword:
        return Icons.lock;
      case TextInputType.phone:
        return Icons.phone;
      case TextInputType.name:
        return Icons.person;
      case TextInputType.datetime:
        return Icons.calendar_month_rounded;
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _isReadOnly = widget.isReadyOnly;
    textFieldFocus = widget.focusNode ?? FocusNode();
    textFieldFocus.addListener(() {
      setState(() {
        isFocused = textFieldFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    textFieldFocus.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.titleText != null,
          child: PrimaryTitleText(
            widget.titleText ?? "",
            color:
                isFocused ? const Color(0xFF1E1E1E) : const Color(0xFFA3A3A3),
          ),
        ),
        if (widget.titleText != null) gapH10,
        TextField(
          canRequestFocus: true,
          focusNode: textFieldFocus,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          obscureText: widget.keyboardType == TextInputType.visiblePassword &&
              isShowPassword,
          onSubmitted: (value) {
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(value);
            }
          },
          onTap: () {
            if (widget.onTFTap != null) {
              widget.onTFTap!();
            }
          },
          keyboardType: widget.keyboardType,
          readOnly: _isReadOnly,
          onChanged: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          style: GoogleFonts.montserrat(
            color: isFocused ? AppTheme.titleColor1 : AppTheme.placeholderColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular((widget.maxLines > 1) ? 12 : 124),
              ),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular((widget.maxLines > 1) ? 12 : 124),
              ),
              borderSide:
                  const BorderSide(color: AppTheme.primaryColor1, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular((widget.maxLines > 1) ? 12 : 124),
              ),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular((widget.maxLines > 1) ? 52 : 124),
              ),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            filled: true,
            fillColor: const Color(0xFFF8F8F8),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.montserrat(
              color: AppTheme.placeholderColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            errorText:
                (widget.fieldId == widget.errorCode && widget.errorText != null)
                    ? widget.errorText
                    : null,
            errorStyle: GoogleFonts.montserrat(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                ? IconButton(
                    onPressed: () {
                      setState(
                        () {
                          isShowPassword = !isShowPassword;
                        },
                      );
                    },
                    icon: Icon(
                      isShowPassword ? Icons.visibility : Icons.visibility_off,
                      color: isFocused
                          ? AppTheme.primaryColor1
                          : AppTheme.placeholderColor,
                    ),
                  )
                : widget.suffixWidget,
            prefixIcon: widget.prefixWidget ??
                (widget.prefixIcon != null
                    ? SizedBox(
                        width: 16,
                        child: Center(
                          child: SvgPicture.asset(
                            widget.prefixIcon!,
                            colorFilter: ColorFilter.mode(
                              isFocused
                                  ? AppTheme.primaryColor1
                                  : AppTheme.placeholderColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      )
                    : getTextFiledPrefixIcon() != null
                        ? Icon(
                            getTextFiledPrefixIcon(),
                            color: isFocused
                                ? AppTheme.primaryColor1
                                : AppTheme.placeholderColor,
                          )
                        : null),
          ),
        ),
      ],
    );
  }
}

// ===========================Message Text Field================================

class CustomMessageTextField extends StatefulWidget {
  const CustomMessageTextField({
    super.key,
    this.titleText,
    required this.hintText,
    this.controller,
    this.suffixWidget,
    this.prefixWidget,
    this.maxLines = 1,
    this.minLines,
    this.onSubmitted,
    this.onChange,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
  });
  final String? titleText;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final int maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  final TextInputAction? textInputAction;
  final String? prefixIcon;
  @override
  State<CustomMessageTextField> createState() => _CustomMessageTextFieldState();
}

class _CustomMessageTextFieldState extends State<CustomMessageTextField> {
  bool isFocused = false;
  late final FocusNode textFieldFocus;

  @override
  void initState() {
    super.initState();
    textFieldFocus = widget.focusNode ?? FocusNode();
    textFieldFocus.addListener(() {
      setState(() {
        isFocused = textFieldFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    textFieldFocus.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.titleText != null,
          child: PrimaryTitleText(
            widget.titleText ?? "",
            color:
                isFocused ? const Color(0xFF1E1E1E) : const Color(0xFFA3A3A3),
          ),
        ),
        if (widget.titleText != null) gapH10,
        TextField(
          canRequestFocus: true,
          focusNode: textFieldFocus,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          onSubmitted: (value) {
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(value);
            }
          },
          onChanged: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          style: GoogleFonts.montserrat(
            color: isFocused ? AppTheme.titleColor1 : AppTheme.placeholderColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Color(0xFFDBDBDB), width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppTheme.primaryColor1, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.montserrat(
              color: AppTheme.placeholderColor,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            errorStyle: GoogleFonts.montserrat(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            suffixIcon: widget.suffixWidget,
            prefixIcon: widget.prefixWidget,
          ),
        ),
      ],
    );
  }
}

// ===========================Searh Text Field================================
class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {super.key, this.backgroundColor, this.onChanged, this.hintText});
  final Color? backgroundColor;
  final Function(String)? onChanged;
  final String? hintText;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final FocusNode textFieldFocus;
  bool isFocused = false;

  void focusListene() {
    setState(() {
      isFocused = textFieldFocus.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    textFieldFocus = FocusNode();
    textFieldFocus.addListener(focusListene);
  }

  @override
  void dispose() {
    super.dispose();
    textFieldFocus.removeListener(focusListene);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      canRequestFocus: true,
      focusNode: textFieldFocus,
      textInputAction: TextInputAction.search,
      onChanged: widget.onChanged,
      style: const TextStyle(
        color: AppTheme.titleColor1,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Color(0xFfE3E3E3), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: AppTheme.primaryColor1, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        filled: false,
        fillColor: widget.backgroundColor ?? const Color(0xFFF5F5F5),
        hintText: widget.hintText ?? "Search services here",
        hintStyle: const TextStyle(
          color: AppTheme.placeholderColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        prefixIcon: SizedBox(
          width: 22,
          height: 22,
          child: Center(
            child: SvgPicture.asset(
              AppAssets.magnifierIcon,
              colorFilter: ColorFilter.mode(
                isFocused ? AppTheme.primaryColor1 : const Color(0xFF878686),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        // suffixIcon: SizedBox(
        //   width: 17,
        //   height: 17,
        //   child: Center(
        //     child: SvgPicture.asset(
        //       ,
        //       width: 17,
        //       height: 17,
        //       colorFilter: ColorFilter.mode(
        //         isFocused ? AppTheme.primaryColor1 : AppTheme.placeholderColor,
        //         BlendMode.srcIn,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
