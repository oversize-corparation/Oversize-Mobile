import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/widgets/translator.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/profile/data/model/payment_model.dart';
import 'package:oversize/features/profile/presentation/screens/card_form_sheet.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<CardModel> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("settings".tr()), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "payment".tr(),
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            28.h,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...cards.map(
                    (e) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: _buildCardPreview(e),
                    ),
                  ),
                  if (cards.isEmpty)
                    Container(
                      height: 150,
                      width: 350,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Translator(
                        uz: "No card added",
                        ru: "Карта не добавлена",
                        en: "No card added",
                      ),
                    ),
                  8.w,
                  ZoomTapAnimation(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return CardFormSheet(
                            isEditMode: false,
                            onSave: (holder, number, date, cvvValue, type) {
                              setState(() {
                                cards.add(
                                  CardModel(
                                    cardHolder: holder,
                                    cardNumber: number ?? "",
                                    validDate: date ?? "",
                                    cardType: type,
                                  ),
                                );
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.darkBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 150,
                      width: 40,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            16.h,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.lightBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: AppColor.darkBlue,
                      size: 30,
                    ),
                    13.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "April,19 2020 12:31",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Order #92287157",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("-\$14,00"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPreview(CardModel card) {
    Widget cardIcon;
    switch (card.cardType) {
      case 'UzCard':
        cardIcon = Image.asset(AppImages.uzcard, height: 40, width: 40);
        break;
      case 'HUMO':
        cardIcon = Image.asset(AppImages.humo, height: 40, width: 40);
        break;
      case 'Visa':
        cardIcon = SvgPicture.asset(AppImages.visa, height: 45, width: 45);
        break;
      case 'Mastercard':
        cardIcon = SvgPicture.asset(
          AppImages.mastercard,
          height: 45,
          width: 45,
        );
        break;
      default:
        cardIcon = Icon(Icons.credit_card, size: 40);
    }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) {
            return CardFormSheet(
              isEditMode: true,
              initialCardHolder: card.cardHolder,
              initialCardNumber: card.cardNumber,
              initialValidDate: card.validDate,
              initialCvv: card.cvv,
              onSave: (holder, number, date, cvvValue, type) {
                setState(() {
                  final index = cards.indexOf(card);
                  cards[index] = CardModel(
                    cardHolder: holder,
                    cardNumber: number ?? "",
                    validDate: date ?? "",
                    cardType: type,
                  );
                });
                Navigator.pop(context);
              },
              onDelete: () {
                setState(() {
                  cards.remove(card);
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
      child: Container(
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          color: AppColor.lightBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardIcon,
                CircleAvatar(
                  backgroundColor: AppColor.lightGray400,
                  child: SvgPicture.asset(AppImages.settings),
                ),
              ],
            ),
            Spacer(),
            Text(
              "**** **** **** ${card.cardNumber.substring(card.cardNumber.length - 4)}",
              style: GoogleFonts.nunitoSans(fontSize: 18),
            ),
            Row(
              children: [
                Text(
                  card.cardHolder ?? '',
                  style: GoogleFonts.nunitoSans(fontSize: 16),
                ),
                Spacer(),
                Text(card.validDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//   ('4123 4567 8901 2345')); // Visa
//   ('8600 1234 5678 9012')); // UzCard
//   ('9860 1234 5678 9012')); // HUMO
//   ('5123 4567 8901 2345')); // Mastercard
//   ('1234 5678 9012 3456')); // Unknown
