import 'package:get/get.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/models/drawer_item_model.dart';
import 'package:venille/core/models/onboarding_item_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/core/models/profile_menu_item_model.dart';

List<OnboardingItemModel> onboardingItems = [
  OnboardingItemModel(
    title1: 'Track Your Cycle,',
    title2: 'Own Your Health ',
    title3: '',
    image: 'assets/images/onboarding_1.jpg',
  ),
  OnboardingItemModel(
    title1: 'Feel Empowered ',
    title2: 'Every Day ',
    title3: '',
    image: 'assets/images/onboarding_2.jpg',
  ),
];

List<ProfileMenuItemModel> profileMenuItems = [
  ProfileMenuItemModel(
    icon: 'assets/icons/icon_user_edit.png',
    title: 'Profile details',
    route_to: AppRoutes.accountDetailsRoute,
  ),
  ProfileMenuItemModel(
    icon: 'assets/icons/icon_settings.png',
    title: 'Settings',
    route_to: AppRoutes.settingsRoute,
  ),
  ProfileMenuItemModel(
    icon: 'assets/icons/icon_help.png',
    title: 'Help',
    route_to: AppRoutes.helpRoute,
  ),
  ProfileMenuItemModel(
    icon: 'assets/icons/icon_legal.png',
    title: 'Legal',
    route_to: AppRoutes.legalRoute,
  ),
];

List<Map<String, dynamic>> profileAvatars = [
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/ff7f96c0-1b71-42c9-819c-486265423ace.jpeg'
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/09a2755b-0792-43e6-8c6b-7707a5e885c8.jpeg'
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/20521429-e409-4883-98bf-64b012878173.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/1e3aa51f-a548-45f5-9521-ea30cd121c10.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/4ff60d93-7032-4c43-9643-5f991fdf4b05.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/4025a787-2e56-4cf5-9605-981dc4616e1c.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/c5718be9-7ab3-4c12-80de-b8a2066eb110.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/ba4cdce3-817f-496a-b2f8-895c2d3061c1.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/1e0fe772-682e-4212-b3cb-3a9ec94a3fc9.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/5aa626e9-5716-455c-816e-2726f4013c3d.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/fbc5a181-79ce-42d4-8f20-ae12b6d0d6e0.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/2feaebff-d3da-48d4-a83d-97eec58cf36e.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/33ede7db-bbf9-4473-b8a3-ce12f6e4dbfa.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/cf749f34-00eb-4c0f-b681-734e8bb195bc.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/661c5dd9-53d2-4925-8794-0907acb8d69f.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/6bc84896-23dd-4de4-8186-000822464ec6.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/fa9e76bf-5687-4ff9-84df-e1ed958dea9c.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/29070b51-d79e-475a-a805-7ca5821ea010.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/acb4c723-e7df-4d02-a7df-fa0a827958a7.jpeg',
  },
  {
    'type': 'AVATAR',
    'image':
        'https://d30n3oi2bakvug.cloudfront.net/versions/original/bb7e12f7-14de-4409-a19c-d877bb90943d.jpeg',
  },
];

List<DrawerItem> drawerItems = [
  DrawerItem(
    title: 'Orders'.tr,
    routeTo: AppRoutes.ordersRoute,
    icon: 'assets/icons/icon_star.png',
    iconData: FluentIcons.box_arrow_up_20_regular,
  ),
  DrawerItem(
    icon: 'assets/icons/icon_help_2.png',
    title: 'Monthly Survey'.tr,
    routeTo: AppRoutes.surveyHistoryRoute,
    iconData: FluentIcons.book_compass_20_regular,
  ),
  DrawerItem(
    icon: 'assets/icons/icon_help_2.png',
    title: 'Contact us'.tr,
    routeTo: AppRoutes.contactUsRoute,
    iconData: FluentIcons.chat_help_20_regular,
  ),
  DrawerItem(
    icon: 'assets/icons/icon_logout.png',
    title: 'Logout'.tr,
    routeTo: '',
  ),
];

final List<Map<String, String>> platformCountries = [
  {'name': 'Afghanistan', 'dialCode': '+93', 'flagEmoji': '🇦🇫'},
  {'name': 'Albania', 'dialCode': '+355', 'flagEmoji': '🇦🇱'},
  {'name': 'Algeria', 'dialCode': '+213', 'flagEmoji': '🇩🇿'},
  {'name': 'Andorra', 'dialCode': '+376', 'flagEmoji': '🇦🇩'},
  {'name': 'Angola', 'dialCode': '+244', 'flagEmoji': '🇦🇴'},
  {'name': 'Antigua and Barbuda', 'dialCode': '+1-268', 'flagEmoji': '🇦🇬'},
  {'name': 'Argentina', 'dialCode': '+54', 'flagEmoji': '🇦🇷'},
  {'name': 'Armenia', 'dialCode': '+374', 'flagEmoji': '🇦🇲'},
  {'name': 'Australia', 'dialCode': '+61', 'flagEmoji': '🇦🇺'},
  {'name': 'Austria', 'dialCode': '+43', 'flagEmoji': '🇦🇹'},
  {'name': 'Azerbaijan', 'dialCode': '+994', 'flagEmoji': '🇦🇿'},
  {'name': 'Bahamas', 'dialCode': '+1-242', 'flagEmoji': '🇧🇸'},
  {'name': 'Bahrain', 'dialCode': '+973', 'flagEmoji': '🇧🇭'},
  {'name': 'Bangladesh', 'dialCode': '+880', 'flagEmoji': '🇧🇩'},
  {'name': 'Barbados', 'dialCode': '+1-246', 'flagEmoji': '🇧🇧'},
  {'name': 'Belarus', 'dialCode': '+375', 'flagEmoji': '🇧🇾'},
  {'name': 'Belgium', 'dialCode': '+32', 'flagEmoji': '🇧🇪'},
  {'name': 'Belize', 'dialCode': '+501', 'flagEmoji': '🇧🇿'},
  {'name': 'Benin', 'dialCode': '+229', 'flagEmoji': '🇧🇯'},
  {'name': 'Bhutan', 'dialCode': '+975', 'flagEmoji': '🇧🇹'},
  {'name': 'Bolivia', 'dialCode': '+591', 'flagEmoji': '🇧🇴'},
  {'name': 'Bosnia and Herzegovina', 'dialCode': '+387', 'flagEmoji': '🇧🇦'},
  {'name': 'Botswana', 'dialCode': '+267', 'flagEmoji': '🇧🇼'},
  {'name': 'Brazil', 'dialCode': '+55', 'flagEmoji': '🇧🇷'},
  {'name': 'Brunei', 'dialCode': '+673', 'flagEmoji': '🇧🇳'},
  {'name': 'Bulgaria', 'dialCode': '+359', 'flagEmoji': '🇧🇬'},
  {'name': 'Burkina Faso', 'dialCode': '+226', 'flagEmoji': '🇧🇫'},
  {'name': 'Burundi', 'dialCode': '+257', 'flagEmoji': '🇧🇮'},
  {'name': 'Cabo Verde', 'dialCode': '+238', 'flagEmoji': '🇨🇻'},
  {'name': 'Cambodia', 'dialCode': '+855', 'flagEmoji': '🇰🇭'},
  {'name': 'Cameroon', 'dialCode': '+237', 'flagEmoji': '🇨🇲'},
  {'name': 'Canada', 'dialCode': '+1', 'flagEmoji': '🇨🇦'},
  {'name': 'Central African Republic', 'dialCode': '+236', 'flagEmoji': '🇨🇫'},
  {'name': 'Chad', 'dialCode': '+235', 'flagEmoji': '🇹🇩'},
  {'name': 'Chile', 'dialCode': '+56', 'flagEmoji': '🇨🇱'},
  {'name': 'China', 'dialCode': '+86', 'flagEmoji': '🇨🇳'},
  {'name': 'Colombia', 'dialCode': '+57', 'flagEmoji': '🇨🇴'},
  {'name': 'Comoros', 'dialCode': '+269', 'flagEmoji': '🇰🇲'},
  {
    'name': 'Congo (Congo-Brazzaville)',
    'dialCode': '+242',
    'flagEmoji': '🇨🇬'
  },
  {'name': 'Congo (Congo-Kinshasa)', 'dialCode': '+243', 'flagEmoji': '🇨🇩'},
  {'name': 'Costa Rica', 'dialCode': '+506', 'flagEmoji': '🇨🇷'},
  {'name': 'Croatia', 'dialCode': '+385', 'flagEmoji': '🇭🇷'},
  {'name': 'Cuba', 'dialCode': '+53', 'flagEmoji': '🇨🇺'},
  {'name': 'Cyprus', 'dialCode': '+357', 'flagEmoji': '🇨🇾'},
  {'name': 'Czechia', 'dialCode': '+420', 'flagEmoji': '🇨🇿'},
  {'name': 'Denmark', 'dialCode': '+45', 'flagEmoji': '🇩🇰'},
  {'name': 'Djibouti', 'dialCode': '+253', 'flagEmoji': '🇩🇯'},
  {'name': 'Dominica', 'dialCode': '+1-767', 'flagEmoji': '🇩🇲'},
  {'name': 'Dominican Republic', 'dialCode': '+1-809', 'flagEmoji': '🇩🇴'},
  {'name': 'Ecuador', 'dialCode': '+593', 'flagEmoji': '🇪🇨'},
  {'name': 'Egypt', 'dialCode': '+20', 'flagEmoji': '🇪🇬'},
  {'name': 'El Salvador', 'dialCode': '+503', 'flagEmoji': '🇸🇻'},
  {'name': 'Equatorial Guinea', 'dialCode': '+240', 'flagEmoji': '🇬🇶'},
  {'name': 'Eritrea', 'dialCode': '+291', 'flagEmoji': '🇪🇷'},
  {'name': 'Estonia', 'dialCode': '+372', 'flagEmoji': '🇪🇪'},
  {'name': 'Eswatini', 'dialCode': '+268', 'flagEmoji': '🇸🇿'},
  {'name': 'Ethiopia', 'dialCode': '+251', 'flagEmoji': '🇪🇹'},
  {'name': 'Fiji', 'dialCode': '+679', 'flagEmoji': '🇫🇯'},
  {'name': 'Finland', 'dialCode': '+358', 'flagEmoji': '🇫🇮'},
  {'name': 'France', 'dialCode': '+33', 'flagEmoji': '🇫🇷'},
  {'name': 'Gabon', 'dialCode': '+241', 'flagEmoji': '🇬🇦'},
  {'name': 'Gambia', 'dialCode': '+220', 'flagEmoji': '🇬🇲'},
  {'name': 'Georgia', 'dialCode': '+995', 'flagEmoji': '🇬🇪'},
  {'name': 'Germany', 'dialCode': '+49', 'flagEmoji': '🇩🇪'},
  {'name': 'Ghana', 'dialCode': '+233', 'flagEmoji': '🇬🇭'},
  {'name': 'Greece', 'dialCode': '+30', 'flagEmoji': '🇬🇷'},
  {'name': 'Grenada', 'dialCode': '+1-473', 'flagEmoji': '🇬🇩'},
  {'name': 'Guatemala', 'dialCode': '+502', 'flagEmoji': '🇬🇹'},
  {'name': 'Guinea', 'dialCode': '+224', 'flagEmoji': '🇬🇳'},
  {'name': 'Guinea-Bissau', 'dialCode': '+245', 'flagEmoji': '🇬🇼'},
  {'name': 'Guyana', 'dialCode': '+592', 'flagEmoji': '🇬🇾'},
  {'name': 'Haiti', 'dialCode': '+509', 'flagEmoji': '🇭🇹'},
  {'name': 'Honduras', 'dialCode': '+504', 'flagEmoji': '🇭🇳'},
  {'name': 'Hungary', 'dialCode': '+36', 'flagEmoji': '🇭🇺'},
  {'name': 'Iceland', 'dialCode': '+354', 'flagEmoji': '🇮🇸'},
  {'name': 'India', 'dialCode': '+91', 'flagEmoji': '🇮🇳'},
  {'name': 'Indonesia', 'dialCode': '+62', 'flagEmoji': '🇮🇩'},
  {'name': 'Iran', 'dialCode': '+98', 'flagEmoji': '🇮🇷'},
  {'name': 'Iraq', 'dialCode': '+964', 'flagEmoji': '🇮🇶'},
  {'name': 'Ireland', 'dialCode': '+353', 'flagEmoji': '🇮🇪'},
  {'name': 'Israel', 'dialCode': '+972', 'flagEmoji': '🇮🇱'},
  {'name': 'Italy', 'dialCode': '+39', 'flagEmoji': '🇮🇹'},
  {'name': 'Jamaica', 'dialCode': '+1-876', 'flagEmoji': '🇯🇲'},
  {'name': 'Japan', 'dialCode': '+81', 'flagEmoji': '🇯🇵'},
  {'name': 'Jordan', 'dialCode': '+962', 'flagEmoji': '🇯🇴'},
  {'name': 'Kazakhstan', 'dialCode': '+7', 'flagEmoji': '🇰🇿'},
  {'name': 'Kenya', 'dialCode': '+254', 'flagEmoji': '🇰🇪'},
  {'name': 'Kiribati', 'dialCode': '+686', 'flagEmoji': '🇰🇮'},
  {'name': 'Kuwait', 'dialCode': '+965', 'flagEmoji': '🇰🇼'},
  {'name': 'Kyrgyzstan', 'dialCode': '+996', 'flagEmoji': '🇰🇬'},
  {'name': 'Laos', 'dialCode': '+856', 'flagEmoji': '🇱🇦'},
  {'name': 'Latvia', 'dialCode': '+371', 'flagEmoji': '🇱🇻'},
  {'name': 'Lebanon', 'dialCode': '+961', 'flagEmoji': '🇱🇧'},
  {'name': 'Lesotho', 'dialCode': '+266', 'flagEmoji': '🇱🇸'},
  {'name': 'Liberia', 'dialCode': '+231', 'flagEmoji': '🇱🇷'},
  {'name': 'Libya', 'dialCode': '+218', 'flagEmoji': '🇱🇾'},
  {'name': 'Liechtenstein', 'dialCode': '+423', 'flagEmoji': '🇱🇮'},
  {'name': 'Lithuania', 'dialCode': '+370', 'flagEmoji': '🇱🇹'},
  {'name': 'Luxembourg', 'dialCode': '+352', 'flagEmoji': '🇱🇺'},
  {'name': 'Madagascar', 'dialCode': '+261', 'flagEmoji': '🇲🇬'},
  {'name': 'Malawi', 'dialCode': '+265', 'flagEmoji': '🇲🇼'},
  {'name': 'Malaysia', 'dialCode': '+60', 'flagEmoji': '🇲🇾'},
  {'name': 'Maldives', 'dialCode': '+960', 'flagEmoji': '🇲🇻'},
  {'name': 'Mali', 'dialCode': '+223', 'flagEmoji': '🇲🇱'},
  {'name': 'Malta', 'dialCode': '+356', 'flagEmoji': '🇲🇹'},
  {'name': 'Marshall Islands', 'dialCode': '+692', 'flagEmoji': '🇲🇭'},
  {'name': 'Mauritania', 'dialCode': '+222', 'flagEmoji': '🇲🇷'},
  {'name': 'Mauritius', 'dialCode': '+230', 'flagEmoji': '🇲🇺'},
  {'name': 'Mexico', 'dialCode': '+52', 'flagEmoji': '🇲🇽'},
  {'name': 'Micronesia', 'dialCode': '+691', 'flagEmoji': '🇫🇲'},
  {'name': 'Moldova', 'dialCode': '+373', 'flagEmoji': '🇲🇩'},
  {'name': 'Monaco', 'dialCode': '+377', 'flagEmoji': '🇲🇨'},
  {'name': 'Mongolia', 'dialCode': '+976', 'flagEmoji': '🇲🇳'},
  {'name': 'Montenegro', 'dialCode': '+382', 'flagEmoji': '🇲🇪'},
  {'name': 'Morocco', 'dialCode': '+212', 'flagEmoji': '🇲🇦'},
  {'name': 'Mozambique', 'dialCode': '+258', 'flagEmoji': '🇲🇿'},
  {'name': 'Myanmar', 'dialCode': '+95', 'flagEmoji': '🇲🇲'},
  {'name': 'Namibia', 'dialCode': '+264', 'flagEmoji': '🇳🇦'},
  {'name': 'Nauru', 'dialCode': '+674', 'flagEmoji': '🇳🇷'},
  {'name': 'Nepal', 'dialCode': '+977', 'flagEmoji': '🇳🇵'},
  {'name': 'Netherlands', 'dialCode': '+31', 'flagEmoji': '🇳🇱'},
  {'name': 'New Zealand', 'dialCode': '+64', 'flagEmoji': '🇳🇿'},
  {'name': 'Nicaragua', 'dialCode': '+505', 'flagEmoji': '🇳🇮'},
  {'name': 'Niger', 'dialCode': '+227', 'flagEmoji': '🇳🇪'},
  {'name': 'Nigeria', 'dialCode': '+234', 'flagEmoji': '🇳🇬'},
  {'name': 'North Korea', 'dialCode': '+850', 'flagEmoji': '🇰🇵'},
  {'name': 'North Macedonia', 'dialCode': '+389', 'flagEmoji': '🇲🇰'},
  {'name': 'Norway', 'dialCode': '+47', 'flagEmoji': '🇳🇴'},
  {'name': 'Oman', 'dialCode': '+968', 'flagEmoji': '🇴🇲'},
  {'name': 'Pakistan', 'dialCode': '+92', 'flagEmoji': '🇵🇰'},
  {'name': 'Palau', 'dialCode': '+680', 'flagEmoji': '🇵🇼'},
  {'name': 'Palestine', 'dialCode': '+970', 'flagEmoji': '🇵🇸'},
  {'name': 'Panama', 'dialCode': '+507', 'flagEmoji': '🇵🇦'},
  {'name': 'Papua New Guinea', 'dialCode': '+675', 'flagEmoji': '🇵🇬'},
  {'name': 'Paraguay', 'dialCode': '+595', 'flagEmoji': '🇵🇾'},
  {'name': 'Peru', 'dialCode': '+51', 'flagEmoji': '🇵🇪'},
  {'name': 'Philippines', 'dialCode': '+63', 'flagEmoji': '🇵🇭'},
  {'name': 'Poland', 'dialCode': '+48', 'flagEmoji': '🇵🇱'},
  {'name': 'Portugal', 'dialCode': '+351', 'flagEmoji': '🇵🇹'},
  {'name': 'Qatar', 'dialCode': '+974', 'flagEmoji': '🇶🇦'},
  {'name': 'Romania', 'dialCode': '+40', 'flagEmoji': '🇷🇴'},
  {'name': 'Russia', 'dialCode': '+7', 'flagEmoji': '🇷🇺'},
  {'name': 'Rwanda', 'dialCode': '+250', 'flagEmoji': '🇷🇼'},
  {'name': 'Saint Kitts and Nevis', 'dialCode': '+1-869', 'flagEmoji': '🇰🇳'},
  {'name': 'Saint Lucia', 'dialCode': '+1-758', 'flagEmoji': '🇱🇨'},
  {
    'name': 'Saint Vincent and the Grenadines',
    'dialCode': '+1-784',
    'flagEmoji': '🇻🇨'
  },
  {'name': 'Samoa', 'dialCode': '+685', 'flagEmoji': '🇼🇸'},
  {'name': 'San Marino', 'dialCode': '+378', 'flagEmoji': '🇸🇲'},
  {'name': 'Sao Tome and Principe', 'dialCode': '+239', 'flagEmoji': '🇸🇹'},
  {'name': 'Saudi Arabia', 'dialCode': '+966', 'flagEmoji': '🇸🇦'},
  {'name': 'Senegal', 'dialCode': '+221', 'flagEmoji': '🇸🇳'},
  {'name': 'Serbia', 'dialCode': '+381', 'flagEmoji': '🇷🇸'},
  {'name': 'Seychelles', 'dialCode': '+248', 'flagEmoji': '🇸🇨'},
  {'name': 'Sierra Leone', 'dialCode': '+232', 'flagEmoji': '🇸🇱'},
  {'name': 'Singapore', 'dialCode': '+65', 'flagEmoji': '🇸🇬'},
  {'name': 'Slovakia', 'dialCode': '+421', 'flagEmoji': '🇸🇰'},
  {'name': 'Slovenia', 'dialCode': '+386', 'flagEmoji': '🇸🇮'},
  {'name': 'Solomon Islands', 'dialCode': '+677', 'flagEmoji': '🇸🇧'},
  {'name': 'Somalia', 'dialCode': '+252', 'flagEmoji': '🇸🇴'},
  {'name': 'South Africa', 'dialCode': '+27', 'flagEmoji': '🇿🇦'},
  {'name': 'South Korea', 'dialCode': '+82', 'flagEmoji': '🇰🇷'},
  {'name': 'South Sudan', 'dialCode': '+211', 'flagEmoji': '🇸🇸'},
  {'name': 'Spain', 'dialCode': '+34', 'flagEmoji': '🇪🇸'},
  {'name': 'Sri Lanka', 'dialCode': '+94', 'flagEmoji': '🇱🇰'},
  {'name': 'Sudan', 'dialCode': '+249', 'flagEmoji': '🇸🇩'},
  {'name': 'Suriname', 'dialCode': '+597', 'flagEmoji': '🇸🇷'},
  {'name': 'Sweden', 'dialCode': '+46', 'flagEmoji': '🇸🇪'},
  {'name': 'Switzerland', 'dialCode': '+41', 'flagEmoji': '🇨🇭'},
  {'name': 'Syria', 'dialCode': '+963', 'flagEmoji': '🇸🇾'},
  {'name': 'Taiwan', 'dialCode': '+886', 'flagEmoji': '🇹🇼'},
  {'name': 'Tajikistan', 'dialCode': '+992', 'flagEmoji': '🇹🇯'},
  {'name': 'Tanzania', 'dialCode': '+255', 'flagEmoji': '🇹🇿'},
  {'name': 'Thailand', 'dialCode': '+66', 'flagEmoji': '🇹🇭'},
  {'name': 'Togo', 'dialCode': '+228', 'flagEmoji': '🇹🇬'},
  {'name': 'Tonga', 'dialCode': '+676', 'flagEmoji': '🇹🇴'},
  {'name': 'Trinidad and Tobago', 'dialCode': '+1-868', 'flagEmoji': '🇹🇹'},
  {'name': 'Tunisia', 'dialCode': '+216', 'flagEmoji': '🇹🇳'},
  {'name': 'Turkey', 'dialCode': '+90', 'flagEmoji': '🇹🇷'},
  {'name': 'Turkmenistan', 'dialCode': '+993', 'flagEmoji': '🇹🇲'},
  {'name': 'Tuvalu', 'dialCode': '+688', 'flagEmoji': '🇹🇻'},
  {'name': 'Uganda', 'dialCode': '+256', 'flagEmoji': '🇺🇬'},
  {'name': 'Ukraine', 'dialCode': '+380', 'flagEmoji': '🇺🇦'},
  {'name': 'United Arab Emirates', 'dialCode': '+971', 'flagEmoji': '🇦🇪'},
  {'name': 'United Kingdom', 'dialCode': '+44', 'flagEmoji': '🇬🇧'},
  {'name': 'United States', 'dialCode': '+1', 'flagEmoji': '🇺🇸'},
  {'name': 'Uruguay', 'dialCode': '+598', 'flagEmoji': '🇺🇾'},
  {'name': 'Uzbekistan', 'dialCode': '+998', 'flagEmoji': '🇺🇿'},
  {'name': 'Vanuatu', 'dialCode': '+678', 'flagEmoji': '🇻🇺'},
  {'name': 'Vatican City', 'dialCode': '+379', 'flagEmoji': '🇻🇦'},
  {'name': 'Venezuela', 'dialCode': '+58', 'flagEmoji': '🇻🇪'},
  {'name': 'Vietnam', 'dialCode': '+84', 'flagEmoji': '🇻🇳'},
  {'name': 'Yemen', 'dialCode': '+967', 'flagEmoji': '🇾🇪'},
  {'name': 'Zambia', 'dialCode': '+260', 'flagEmoji': '🇿🇲'},
  {'name': 'Zimbabwe', 'dialCode': '+263', 'flagEmoji': '🇿🇼'},
];
