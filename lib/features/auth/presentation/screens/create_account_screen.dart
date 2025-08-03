import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // login muvaffaqiyatli bo‘ldi
            context.pushNamed(
              AppRouter.otp,
              extra: emailController.text.trim(),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SvgPicture.asset(AppImages.bubbleCreate, color: AppColor.bubble1),
              Align(
                alignment: Alignment(1, -1),
                child: SvgPicture.asset(
                  AppImages.bubbleCreate2,
                  color: AppColor.deepPurple,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      80.h,
                      Text(
                        "createaccount".tr(),
                        style: GoogleFonts.raleway(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),

                      80.h,
                      TextfieldWidget(
                        hint: 'firstname'.tr(),
                        controller: firstNameController,
                      ),
                      8.h,
                      TextfieldWidget(
                        hint: 'lastname'.tr(),
                        controller: lastNameController,
                      ),
                      8.h,
                      // Email
                      TextfieldWidget(
                        hint: 'email'.tr(),
                        controller: emailController,
                      ),
                      8.h,
                      // Password
                      TextfieldWidget(
                        hint: 'password'.tr(),
                        isPassword: true,
                        controller: passwordController,
                      ),
                      8.h,

                      // Phone number
                      PhonefieldWidget(controller: phoneController),
                      32.h,

                      // Done button
                      state is AuthLoading
                          ? Center(child: CircularProgressIndicator())
                          : ButtonWidget(
                              onPressed: () {
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();
                                final firstName = firstNameController.text
                                    .trim();
                                final lastName = lastNameController.text.trim();
                                final phone = phoneController.text.trim();

                                context.read<AuthBloc>().add(
                                  CreateAccountRequested(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    password: password,
                                    phone: phone,
                                  ),
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
