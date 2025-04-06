import 'package:flutter/material.dart';
import 'package:healthcare/widgets/Appointment_Card.dart';
import 'package:healthcare/widgets/bottom_nav_item.dart';

class HospitalFinderScreen extends StatefulWidget {
  const HospitalFinderScreen({super.key});

  @override
  State<HospitalFinderScreen> createState() => _HospitalFinderScreenState();
}

class _HospitalFinderScreenState extends State<HospitalFinderScreen> {
  final int _currentImageIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          // Top section with green background
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              image: DecorationImage(
                image: const AssetImage('assets/images/pattern.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.green.withOpacity(0.2),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status bar info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '9:41',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Greeting
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Hello, Rahul ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('👋', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Let's find the best Hospital
                Text(
                  "Let's find the best\nHospital for you",
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Which hospital you are looking for?',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main content area (white background)
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner carousel
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage('assets/hospital_image.jpg'),
                          opacity: (90),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Text overlay for banner
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '100%',
                                  style: theme.textTheme.displayMedium,
                                ),
                                Text(
                                  'health cover,',
                                  style: theme.textTheme.displayMedium,
                                ),
                                Text(
                                  '0% stress',
                                  style: theme.textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ),

                          // Dots indicator at bottom
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                4,
                                (index) => Container(
                                  width: index == _currentImageIndex ? 18 : 8,
                                  height: 8,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color:
                                        index == _currentImageIndex
                                            ? theme.colorScheme.secondary
                                            : theme.colorScheme.secondary
                                                .withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Services section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Services', style: theme.textTheme.titleLarge),
                        // 1. View All - made tappable
                        InkWell(
                          onTap: () {},
                          splashColor: theme.colorScheme.secondary.withOpacity(
                            0.3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Text(
                                  'View all',
                                  style: TextStyle(
                                    color: theme.colorScheme.secondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: theme.colorScheme.secondary,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Service cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 2. Box of appointment booking - made tappable
                        _buildServiceCard(
                          icon: Icons.person,
                          label: 'Book\nAppointment',
                          theme: theme,
                          onTap: () {},
                        ),
                        // 3. Box of health status - made tappable
                        _buildServiceCard(
                          icon: Icons.favorite,
                          label: 'Health\nStatus',
                          theme: theme,
                          onTap: () {},
                        ),
                        // 4. Box of medical history - made tappable
                        _buildServiceCard(
                          icon: Icons.medical_services,
                          label: 'Medical\nHistory',
                          theme: theme,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Recent Activity section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent activity',
                          style: theme.textTheme.titleLarge,
                        ),
                        // 5. Weekly dropdown - made tappable
                        InkWell(
                          onTap: () {},
                          splashColor: theme.colorScheme.secondary.withOpacity(
                            0.3,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Weekly',
                                  style: TextStyle(
                                    color: theme.colorScheme.secondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: theme.colorScheme.secondary,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Appointment cards with tappable buttons for reschedule and cancel
                    AppointmentCard(
                      date: '20 NOV 2024, 10:45 AM',
                      hospital: 'Civil Hospital',
                      doctor: 'Dr. Sudhanshu Jadhav',
                      isConfirmed: true,
                      theme: theme,
                      // Add onReschedule callback
                      // Add onCancel callback
                    ),
                    const SizedBox(height: 12),

                    AppointmentCard(
                      date: '20 NOV 2024, 10:00 AM',
                      hospital: 'Civil Hospital',
                      doctor: 'Dr. Sudhanshu Jadhav',
                      isConfirmed: false,
                      theme: theme,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom navigation bar
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavItem(
                  icon: Icons.home,
                  label: 'Home',
                  isSelected: true,
                  theme: theme,
                ),
                BottomNavItem(
                  icon: Icons.family_restroom,
                  label: 'Family',
                  isSelected: false,
                  theme: theme,
                ),
                BottomNavItem(
                  icon: Icons.local_hospital,
                  label: 'Emergency',
                  isSelected: false,
                  theme: theme,
                ),
                BottomNavItem(
                  icon: Icons.person,
                  label: 'Profile',
                  isSelected: false,
                  theme: theme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String label,
    required ThemeData theme,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: theme.colorScheme.secondary.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
