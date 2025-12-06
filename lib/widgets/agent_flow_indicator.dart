import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AgentFlowIndicator extends StatefulWidget {
  final int activeStep;

  const AgentFlowIndicator({
    Key? key,
    required this.activeStep,
  }) : super(key: key);

  @override
  State<AgentFlowIndicator> createState() => _AgentFlowIndicatorState();
}

class _AgentFlowIndicatorState extends State<AgentFlowIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStep('Monitor', 0),
          _buildArrow(0),
          _buildStep('Decide', 1),
          _buildArrow(1),
          _buildStep('Execute', 2),
        ],
      ),
    );
  }

  Widget _buildStep(String label, int step) {
    final isActive = widget.activeStep == step;
    final isCompleted = widget.activeStep > step;

    return Column(
      children: [
        Container(
          width: AppSizes.flowStepSize,
          height: AppSizes.flowStepSize,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.activeColor
                : isCompleted
                    ? AppColors.completedColor
                    : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white)
                : Text(
                    '${step + 1}',
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? AppColors.activeColor : Colors.grey.shade700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildArrow(int step) {
    final isActive = widget.activeStep == step + 1;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Icon(
          Icons.arrow_forward,
          color: isActive ? AppColors.activeColor : Colors.grey.shade400,
          size: isActive
              ? AppSizes.flowArrowSize + (_controller.value * 4)
              : AppSizes.flowArrowSize,
        );
      },
    );
  }
}
