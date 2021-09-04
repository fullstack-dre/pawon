part of "widgets.dart";

class PrimaryButton extends StatelessWidget {

  final String content;
  final bool isGoogleButton;
  final bool isCTA;
  final bool isMinified;
  final Function() onPressed;
  const PrimaryButton({
    Key? key,
    required this.content,
    required this.isGoogleButton,
    required this.isMinified,
    required this.isCTA,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: isGoogleButton
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_google, color: ColorModel.kWhite),
            SizedBox(width: Spacers.m16),
            Text(
              this.content,
              style: isMinified
              ? Font.textMMedium.copyWith(
                  color: this.isCTA ? ColorModel.kWhite : ColorModel.majorText,
                )
              : Font.textLMedium.copyWith(
                color: this.isCTA ? ColorModel.kWhite : ColorModel.majorText,
              ),
            ),
          ],
        )
      : Text(
          this.content,
          style: Font.textLMedium.copyWith(
            color: this.isCTA ? ColorModel.kWhite : ColorModel.majorText,
          ),
        ),
      style: ElevatedButton.styleFrom(
        primary: this.isCTA ? ColorModel.primaryRed : ColorModel.kWhite,
        padding: EdgeInsets.only(
          top: isMinified ? 10 : Spacers.m16,
          bottom: isMinified ? 12 : 18,
          left: this.isGoogleButton || isMinified ? 40 :  52,
          right: this.isGoogleButton || isMinified ? 40 : 52
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: this.isCTA ? Colors.transparent : ColorModel.kText),
          borderRadius: Spacers.borderRadius
        )
      ),
    );
  }
}