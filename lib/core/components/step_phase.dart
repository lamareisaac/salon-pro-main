import 'package:flutter/material.dart';

import '../utils/font.dart';
import 'my_spacing.dart';
import 'saloon_button.dart';

class StepPhase extends StatelessWidget {
  final int current;
  final int steps;
  final double height;
  final double gap;

  const StepPhase(
      {super.key,
      this.current = 0,
      this.steps = 8,
      this.height = 10,
      this.gap = 5});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildPhases(),
      ),
    );
  }

  List<Widget> buildPhases() {
    List<Widget> df = [];
    for (var i = 0; i < steps; i++) {
      df.add(phaseItem(active: i <= current, withGap: i < steps));
    }
    return df;
  }

  Widget phaseItem({bool active = false, bool withGap = true}) {
    return Expanded(
      child: Container(
        margin: MySpacing.only(right: withGap ? gap : 0),
        height: height,
        decoration: BoxDecoration(
          color: active ? AppColors.black : AppColors.lightGrey,
        ),
      ),
    );
  }
}

typedef bool ValidateCallback(int step);

class SaloonAppStepper extends StatefulWidget {
  final Function onBack;
  final ValidateCallback onNext;
  final ValueChanged<int>? next;
  final Function onComplete;
  final Widget? bottomWidget;
  final int nbSteps;
  final bool hardBack;

  const SaloonAppStepper({
    super.key,
    required this.onBack,
    required this.onNext,
    required this.onComplete,
    this.bottomWidget,
    required this.nbSteps,
    this.hardBack = false,
    this.next,
  });

  @override
  State<SaloonAppStepper> createState() => _SaloonAppStepperState();
}

class _SaloonAppStepperState extends State<SaloonAppStepper> {
  int currentStep = 0;
  int nbSteps = 0;

  @override
  void initState() {
    super.initState();
    nbSteps = widget.nbSteps;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MySpacing.only(top: 16),
      color: AppColors.white,
      child: Column(
        children: [
          StepPhase(current: currentStep, steps: nbSteps, height: 6),
          MySpacing.height(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SaloonElevatedButton(
                label: 'Retour',
                backgroundColor: AppColors.white,
                color: AppColors.black,
                onPressed: () {
                  if (currentStep == 0) {
                    if (widget.hardBack) {
                      widget.onBack(-1);
                    }
                    return;
                  }
                  setState(() {
                    currentStep--;
                    widget.onBack(currentStep);
                  });
                },
              ),
              SaloonElevatedButton(
                label: currentStep < (nbSteps - 1) ? 'Suivant' : 'Terminé',
                onPressed: () {
                  if (currentStep > nbSteps) return;
                  if (currentStep == (nbSteps - 1)) {
                    widget.onComplete();
                    return;
                  }
                  setState(() {
                    if (widget.onNext(currentStep)) {
                      currentStep++;
                      if (widget.next != null) {
                        widget.next!(currentStep);
                      }
                    }
                  });
                },
              ),
            ],
          ),
          () {
            if (widget.bottomWidget != null) {
              return widget.bottomWidget!;
            }
            return const SizedBox.shrink();
          }()
        ],
      ),
    );
  }
}
