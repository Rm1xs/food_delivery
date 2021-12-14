import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/delivery/presentation/payment/payment_delivery_main_page.dart';
import 'package:food_delivery/screens/appbar/appbar_with_button.dart';

import 'general_info/general_info_main_page.dart';

class DeliveryMainPage extends StatefulWidget {
  const DeliveryMainPage({Key? key}) : super(key: key);

  @override
  State<DeliveryMainPage> createState() => _DeliveryMainPageState();
}

class _DeliveryMainPageState extends State<DeliveryMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbarWithButton('Delivery', true, context),
        body: Column(
          children: [
            Expanded(child: _buildStepper(StepperType.horizontal)),
          ],
        ),
      ),
    );
  }

  int currentStep = 0;

  CupertinoStepper _buildStepper(StepperType type) {
    final bool canCancel = currentStep > 0;
    final bool canContinue = currentStep < 2;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (int step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (int i = 0; i < 3; ++i)
          _buildStep(
            title: Text('Step ${i + 1}'),
            isActive: i == currentStep,
            state: i == currentStep
                ? StepState.editing
                : i < currentStep
                    ? StepState.complete
                    : StepState.indexed,
            index: i,
          ),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    required int index,
  }) {
    if (index == 0) {
      return Step(
        title: title,
        subtitle: const Text('Information'),
        state: state,
        isActive: isActive,
        content: LimitedBox(
            maxWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            child: const GeneralInfoMainPage()),
      );
    }
    if (index == 1) {
      return Step(
        title: title,
        subtitle: const Text('Payment'),
        state: state,
        isActive: isActive,
        content: LimitedBox(
            maxWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            child: const PaymentDeliveryMainPage()),
      );
    }
    if (index == 2) {
      return Step(
        title: title,
        subtitle: const Text('Track delivery'),
        state: state,
        isActive: isActive,
        content: LimitedBox(
            maxWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            child: deliveryStatus()),
      );
    } else {
      return Step(
        title: title,
        subtitle: const Text('Information'),
        state: state,
        isActive: isActive,
        content: LimitedBox(
          maxWidth: 300,
          maxHeight: 300,
          child: Container(
            child: const Text('not 1'),
          ),
        ),
      );
    }
  }

  Widget deliveryStatus() {
    return Column(
      children: const [Text('Curently not saving order. ')],
    );
  }
}
