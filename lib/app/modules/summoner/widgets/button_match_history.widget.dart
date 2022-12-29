// import 'package:flutter/material.dart';

// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import 'package:teemo_professor/app/modules/summoner/summoner_store.dart';
// import 'package:teemo_professor/libraries/common/design/colors.dart';
// import 'package:teemo_professor/libraries/common/design/texts.dart';

// class ButtonModalWidget extends StatelessWidget {
//   ButtonModalWidget({super.key});

//   final SummonerStore store = Modular.get();

//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           hoverColor: Colors.transparent,
//           onTap: () {
//             store.toggleMatchHistoryListButton();
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             height: 50,
//             width: 300,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   width: 2,
//                   color: store.tappedInMatchHistoryButton
//                       ? TPColor.white
//                       : TPColor.purple),
//               borderRadius: BorderRadius.circular(20),
//               color: store.tappedInMatchHistoryButton
//                   ? TPColor.purple.withOpacity(0.8)
//                   : TPColor.purple,
//               boxShadow: store.tappedInMatchHistoryButton
//                   ? [
//                       BoxShadow(
//                         color: Colors.grey.shade50,
//                         offset: const Offset(-6, 6),
//                         blurRadius: 15,
//                         spreadRadius: 1,
//                       ),
//                     ]
//                   : [
//                       BoxShadow(
//                         color: Colors.grey.shade400,
//                         offset: const Offset(-6, 6),
//                         blurRadius: 15,
//                         spreadRadius: 1,
//                       ),
//                     ],
//             ),
//             child: Center(
//               child: Column(
//                 children: [
//                   Text(
//                     store.tappedInMatchHistoryButton ? 'Ver menos' : 'Ver mais',
//                     style: TPTexts.t6(
//                       color: store.tappedInMatchHistoryButton
//                           ? TPColor.black.withOpacity(0.35)
//                           : TPColor.black,
//                     ),
//                   ),
//                   store.tappedInMatchHistoryButton
//                       ? Icon(
//                           Icons.arrow_upward,
//                           color: TPColor.black.withOpacity(0.35),
//                         )
//                       : const Icon(Icons.arrow_downward)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
