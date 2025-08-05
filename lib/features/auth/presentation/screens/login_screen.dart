import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // login muvaffaqiyatli bo‘ldi
            context.pushNamed(AppRouter.pinSetup);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SvgPicture.asset(AppImages.bubbleLogin, color: AppColor.bubble1),
              SvgPicture.asset(
                AppImages.bubbleLogin2,
                color: AppColor.deepPurple,
              ),
              Align(
                alignment: Alignment(1, -0.3),
                child: SvgPicture.asset(
                  AppImages.bubbleLogin4,
                  color: AppColor.deepPurple,
                ),
              ),
              Align(
                alignment: Alignment(1, 1),

                child: SvgPicture.asset(
                  AppImages.bubbleLogin3,
                  color: AppColor.bubble3,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 12),
                    Text(
                      "login".tr(),
                      style: GoogleFonts.raleway(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),

                    4.h,
                    Text(
                      "loginsub".tr(),
                      style: GoogleFonts.nunitoSans(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    32.h,

                    // Email
                    TextfieldWidget(
                      hint: 'email'.tr(),
                      controller: emailController,
                    ),
                    8.h, // Password
                    TextfieldWidget(
                      hint: 'password'.tr(),
                      isPassword: true,
                      controller: passwordController,
                    ),

                    32.h,

                    // Done button
                    ButtonWidget(
                      isLoading: state is AuthLoading,
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        context.read<AuthBloc>().add(
                          LoginRequested(email: email, password: password),
                        );
                      },
                      text: 'next'.tr(),
                    ),
                    16.h,

                    // Cancel
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
            ],
          );
        },
      ),
    );
  }
}
