import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/services/local_storage.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/auth/presentation/widgets/otp_widget.dart';
import 'package:oversize/config/widgets/button_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode _otpFocusNode = FocusNode();
  String? otpCode;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _otpFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = GoRouterState.of(context).extra as String;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthSuccess) {
            final hasPin = HiveLocalStorageService.containsKey('user_pin');

            if (hasPin) {
              context.goNamed(AppRouter.home);
            } else {
              context.goNamed(AppRouter.pinSetup);
            }
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          return Stack(
            children: [
              Align(
                alignment: Alignment(1, -1),
                child: SvgPicture.asset(
                  AppImages.bubbleOtp,
                  color: AppColor.bubble1,
                ),
              ),
              Align(
                alignment: Alignment(1, -1),
                child: SvgPicture.asset(
                  AppImages.bubbleOtp2,
                  color: AppColor.deepPurple,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 3),
                      Container(
                        width: 105,
                        height: 105,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.boxShadow,
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: AppColor.white,
                        ),
                        child: ClipOval(
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'otptitle'.tr(),
                        style: GoogleFonts.raleway(
                          color: AppColor.cancel,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.21,
                        ),
                      ),
                      4.h,
                      Text(
                        textAlign: TextAlign.center,
                        'otpsub'.tr(),
                        style: GoogleFonts.nunitoSans(
                          color: AppColor.deepBlack,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      13.h,
                      Text(
                        textAlign: TextAlign.center,
                        '$email',
                        style: GoogleFonts.nunitoSans(
                          color: AppColor.deepBlack,
                          fontSize: 16,
                          letterSpacing: 1.7,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      28.h,
                      OtpWidget(
                        focusNode: _otpFocusNode,
                        onCompleted: (code) {
                          setState(() {
                            otpCode = code;
                          });
                        },
                      ),
                      Spacer(flex: 5),
                      ButtonWidget(
                        isLoading: state is AuthLoading,
                        onPressed: () {
                          if (otpCode != null && otpCode!.length == 6) {
                            context.read<AuthBloc>().add(
                              OtpVerifyRequested(
                                email: email,
                                code: otpCode!,
                                restoration: false,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid OTP")),
                            );
                          }
                        },
                        text: 'next'.tr(),
                      ),
                      16.h,
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "cancel".tr(),
                            style: GoogleFonts.nunitoSans(
                              color: AppColor.cancel,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
