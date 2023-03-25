import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import '../data/data_vos/snack_vo.dart';
import '../resources/colors.dart';

class VoucherItemDetailsView extends StatefulWidget {
  VoucherItemDetailsView(
      {Key? key,
      required this.addedSnackList,
      required this.onRemoveSnack,
      required this.totalAmountForSnack})
      : super(key: key);
  final List<SnackVO?> addedSnackList;
  final Function(int finalTotalAmonunt) onRemoveSnack;
  late int totalAmountForSnack;

  @override
  State<VoucherItemDetailsView> createState() => _VoucherItemDetailsViewState();
}

class _VoucherItemDetailsViewState extends State<VoucherItemDetailsView> {
  late List<int?> leftQuantityList;
  late List<int?> leftPriceList;
  List<int?> totalAmountAfter = [];
  late int finalTotalAmount = widget.totalAmountForSnack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: MARGIN_SMALL_10X,),
        ListView.builder(
            shrinkWrap: true,
            itemCount: (widget.addedSnackList.isNotEmpty)
                ? widget.addedSnackList.length
                : 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: MARGIN_SMALL_5X),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                finalTotalAmount = finalTotalAmount -
                                    (widget.addedSnackList[index]!.quantity! *
                                        widget.addedSnackList[index]!.price! *
                                        1000);
                              });
                              debugPrint(
                                  "==================================> FINAL TOTAL PRICE = $finalTotalAmount");
                              widget.addedSnackList.removeAt(index);
                              widget.onRemoveSnack(finalTotalAmount);
                            },
                            child: SizedBox(
                              height: MARGIN_MEDIUM_20X,
                              width: MARGIN_MEDIUM_20X,
                              child: Image.asset(
                                CANCEL_IMAGE,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: MARGIN_SMALL_8X),
                          Text(
                            widget.addedSnackList.isNotEmpty
                                ? "${widget.addedSnackList[index]?.name} (Qt. ${widget.addedSnackList[index]?.quantity})" ??
                                    ""
                                : "-",
                            style: GoogleFonts.dmSans(
                                fontSize: TEXT_MEDIUM,
                                fontWeight: FontWeight.w700,
                                color: LIGHT_GREY_COLOR),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.addedSnackList.isNotEmpty
                          ? "${(widget.addedSnackList[index]!.price! * 1000 * widget.addedSnackList[index]!.quantity!).toString()} Ks"
                          : "-",
                      style: GoogleFonts.dmSans(
                          fontSize: TEXT_MEDIUM,
                          fontWeight: FontWeight.w700,
                          color: LIGHT_GREY_COLOR),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
