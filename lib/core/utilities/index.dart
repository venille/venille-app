import 'package:get/get.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/models/drawer_item_model.dart';
import 'package:venille/core/models/health_education_topic_model.dart';
import 'package:venille/core/models/onboarding_item_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/core/models/forum_blog_model.dart';
import 'package:venille/core/models/profile_menu_item_model.dart';
import 'package:venille/presentation/public/onboarding_screen.dart';

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
    title: 'Settings'.tr,
    route_to: AppRoutes.settingsRoute,
  ),
  ProfileMenuItemModel(
    icon: 'assets/icons/icon_help.png',
    title: 'Help'.tr,
    route_to: AppRoutes.helpRoute,
  ),
  ProfileMenuItemModel(
    icon: 'assets/icons/icon_legal.png',
    title: 'Legal'.tr,
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
    title: 'Order Sanitary Pads'.tr,
    routeTo: AppRoutes.orderPadRoute,
    icon: 'assets/icons/icon_star.png',
    iconData: FluentIcons.box_arrow_up_20_regular,
  ),
  DrawerItem(
    icon: 'assets/icons/icon_help_2.png',
    title: 'Monthly Feedback'.tr,
    routeTo: AppRoutes.feedbackSurveyRoute,
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

final List<HealthEducationTopicModel> healthEducationTopics = [
  HealthEducationTopicModel(
    coverImageUrl: 'assets/images/learn/menstral_health.jpg',
    title: "Menstrual Health",
    description: '''
      Understanding the Menstrual Cycle
The menstrual cycle is a natural, monthly process that prepares the female body for pregnancy. It typically lasts 28 days, though cycles can range between 21 to 35 days depending on the individual.
The cycle begins on the first day of menstruation (bleeding) and ends on the day before the next period starts. It is divided into four main phases:
Menstrual Phase (Day 1–5):
 This is when the uterus sheds its lining if pregnancy has not occurred. Bleeding happens during this time and may last 3 to 7 days. It is normal to experience cramps, fatigue, and mood changes.

Follicular Phase (Day 1–13):
 Overlaps with menstruation. The brain signals the ovaries to produce follicles. One dominant follicle matures into an egg. At the same time, the uterus starts rebuilding its lining for a possible pregnancy.

Ovulation Phase (Day 14):
 Around the middle of the cycle, the mature egg is released from the ovary. This is the most fertile window of the month. Some people may notice clear, stretchy discharge or mild pain in one side of the lower belly.

Luteal Phase (Day 15–28):
 After ovulation, the body produces progesterone to support a potential pregnancy. If the egg is not fertilized, hormone levels drop, triggering menstruation, and the cycle begins again.

Understanding the menstrual cycle can help with:
- Tracking ovulation and fertility
- Managing symptoms like cramps or mood swings
- Identifying abnormalities or changes in the cycle

Common Menstrual Disorders
Menstrual disorders affect how the body goes through the cycle and can impact health and daily life. Some common conditions include:
Dysmenorrhea:
 Painful cramps before or during menstruation caused by intense uterine contractions. There are two types:

- Primary dysmenorrhea (common and not linked to a medical issue)

- Secondary dysmenorrhea (due to conditions like endometriosis or fibroids)

Amenorrhea:
 The absence of menstruation.

Primary amenorrhea: No period by age 15

Secondary amenorrhea: Stopping periods for 3+ months after normal cycles
 Causes can include stress, low body weight, PCOS, or thyroid disorders.

Menorrhagia:
 Unusually heavy or prolonged periods. Signs include bleeding through pads or tampons every hour, passing large clots, or bleeding lasting more than 7 days.

Premenstrual Syndrome (PMS):
 A group of emotional and physical symptoms that occur before menstruation. Symptoms may include:

- Irritability and mood swings
- Breast tenderness
- Fatigue
- Bloating
- Food cravings

Important:
 If symptoms are severe, irregular, or disrupt daily life, see a healthcare provider. Early treatment can improve quality of life and detect any underlying conditions.
    ''',
  ),
  HealthEducationTopicModel(
    coverImageUrl: 'assets/images/learn/menstral_hygiene.jpg',
    title: "Menstrual Hygiene",
    description: '''
    Menstrual Hygiene Best Practices
Maintaining proper hygiene during your menstrual period is essential for both comfort and health. Poor hygiene can lead to irritation, infections, or unpleasant odor. Follow these best practices to stay clean and protected:
Best Practices
- Change pads or tampons every 4–6 hours, or more frequently if the flow is heavy. This helps prevent bacterial growth and reduces the risk of infections or rashes.
- Use clean, breathable cotton underwear to allow airflow and reduce moisture buildup.
- Wash your hands thoroughly with soap and water before and after handling any menstrual products.
- Clean the vulva daily with plain water. Avoid harsh soaps, douching, or scented products that can disturb the natural pH balance.
- Dispose of used products responsibly:
  - Wrap used pads or tampons in paper or the product’s wrapper.
  - Never flush them down the toilet as they can clog plumbing and harm the environment.
  - Place them in a bin designated for sanitary waste if available.

Reusable Menstrual Products
Reusable menstrual products are safe, sustainable, and cost-effective. They are becoming popular as eco-conscious alternatives to disposable items.
Types of Reusable Products
- Menstrual Cups:
  Made of medical-grade silicone or rubber, cups are inserted into the vagina to collect blood. They can be worn for up to 8–12 hours and reused for several years with proper care.
- Cloth Pads:
  These fabric pads are worn like disposables but are washed and reused. They come in different sizes and absorbencies.
- Period Underwear:
  Designed with absorbent layers built-in, these panties can hold menstrual flow and be washed for reuse.

Care Tips
- Always sterilize menstrual cups before and after each cycle (boil in water for 5–10 minutes).
- Rinse and wash cloth pads or period underwear with cold water first, then with mild detergent. Dry under sunlight or in a clean, dry space.
- Store clean products in a breathable bag or container to avoid moisture buildup.
    ''',
  ),
  HealthEducationTopicModel(
    coverImageUrl: 'assets/images/learn/reproductive_health.jpg',
    title: "Sexual & Reproductive Health",
    description: '''
      Understanding Sexually Transmitted Infections (STIs)
Sexually Transmitted Infections (STIs) are infections passed from one person to another through sexual contact. This can include vaginal, anal, or oral sex. They affect people of all ages and backgrounds but are especially common among young people due to limited access to accurate sexual health education and services.
Common STIs
- Chlamydia: Often silent but can cause pelvic pain and discharge.
- Gonorrhea: May lead to painful urination and discharge; can infect the genitals, rectum, or throat.
- HIV (Human Immunodeficiency Virus): Attacks the immune system. Untreated, it can lead to AIDS.
- HPV (Human Papillomavirus): Some strains cause genital warts; others are linked to cervical cancer.

Symptoms to Watch For
- Unusual vaginal or penile discharge
- Pain or burning sensation when urinating
- Genital sores, warts, or rashes
- Lower abdominal or pelvic pain

Note: Many STIs show no symptoms at first. That’s why regular testing is crucial.

Prevention and Care
- Use condoms every time you have sex.
- Get tested regularly, especially if you have new or multiple partners.
- Limit your number of sexual partners and ensure mutual testing before starting a new sexual relationship.
- Get vaccinated for STIs like HPV and Hepatitis B.
- Practice safe sex with condoms.
- Get tested regularly, especially if you have new or multiple partners.
- Limit your number of sexual partners and ensure mutual testing before starting a new sexual relationship.
- Get vaccinated for STIs like HPV and Hepatitis B.
- Practice safe sex with condoms.

Understanding Consent
Consent is the foundation of any respectful and healthy sexual relationship. It means both people clearly agree to engage in sexual activity, and it must be ongoing, mutual, and enthusiastic.
Key Points About Consent
- Freely given: No one should feel pressured, manipulated, or forced into sexual activity.
- Reversible: Anyone can change their mind at any time — even during sex.
- Informed: Everyone involved must know exactly what they’re agreeing to.
- Enthusiastic: Look for a clear, excited yes — not silence or uncertainty.
- Specific: Saying yes to one act doesn’t mean saying yes to everything.

Important Reminders
- No means no. Full stop.
- Consent cannot be given if someone is intoxicated, asleep, or under threat.
- Ask, listen, respect. Good communication builds trust and safety.
''',
  ),
  HealthEducationTopicModel(
    coverImageUrl: 'assets/images/learn/contraception.jpg',
    title: "Contraception",
    description: '''
      Types of Contraceptives
Contraceptives are methods used to prevent pregnancy. Choosing the right one depends on your health, lifestyle, age, and reproductive goals. Below are the main types:

1. Barrier Methods
These physically block sperm from reaching the egg.
- Male condoms: Worn over the penis; also protect against most STIs.
- Female condoms: Placed inside the vagina; also provide STI protection.

Pros:
- Easily accessible
- Protects against STIs
- No hormones involved

2. Hormonal Methods
These change hormone levels to prevent ovulation.
- Birth control pills: Taken daily.
- Injections: Given every 3 months.
- Implants: A small rod inserted under the skin; lasts 3–5 years.
- Patches or vaginal rings: Released slowly over time.

Pros:
- Highly effective
- Regulates periods
- Reduces menstrual pain

Cons:
- May cause side effects like mood changes or weight gain
- No STI protection

3. Intrauterine Devices (IUDs)
Small T-shaped devices placed in the uterus by a healthcare provider.
- Hormonal IUDs: Last 3–8 years
- Copper IUDs: Last up to 10 years; non-hormonal

Pros:
- Long-term
- Low maintenance
- Highly effective

Cons:
- Requires medical insertion and removal
- May cause cramping or irregular bleeding at first

4. Permanent Methods
For people who are certain they do not want children in the future.
- Vasectomy: A minor surgery that blocks sperm in males
- Tubal ligation: Surgery that blocks or seals the fallopian tubes in females

Pros:
- Permanent and very effective

Cons:
- Not reversible
- No protection against STIs
''',
  ),
  HealthEducationTopicModel(
    coverImageUrl: 'assets/images/learn/mental_health.jpg',
    title: "Mental Health",
    description: '''
    Emotional Wellbeing During Menstruation
Menstruation doesn’t just affect the body — it also impacts the mind. Fluctuating hormone levels, especially estrogen and progesterone, can influence emotions in the days leading up to and during your period.
Common emotional symptoms include:
- Irritability
- Mood swings
- Anxiety or tension
- Sadness or tearfulness
- Difficulty concentrating

These feelings are normal, but tracking your emotional patterns using a journal or app can help you anticipate and manage them better.
Helpful practices include:
- Journaling – Writing about your feelings helps process emotions.
- Exercise – Physical activity releases endorphins, which improve mood.
- Mindfulness & breathing exercises – Calm the mind and reduce stress.
- Adequate rest and nutrition – These can stabilize your energy and emotions.

When to Seek Help
While occasional mood changes are normal, you should seek support if:
- You feel sad, hopeless, or anxious most days.
- Your mood changes interfere with daily life or relationships.
- You feel overwhelmed or unable to cope.
- You think about hurting yourself or others.
- You have thoughts of suicide.

Remember: It’s okay to ask for help. Speak to a trusted adult, a school counselor, or a mental health professional. Taking care of your emotional health is just as important as caring for your physical health. You’re not alone.
''',
  ),
  HealthEducationTopicModel(
      coverImageUrl: 'assets/images/learn/nutrition_healthy_living.jpg',
      title: "Nutrition",
      description: '''
    Foods to Support Menstrual Health
What you eat can play a big role in how you feel during your period. The right nutrients can ease cramps, fight fatigue, and support hormonal balance.
1. Iron-rich foods
 During menstruation, your body loses blood, which can lower iron levels. Low iron can lead to tiredness and dizziness.
 Include:
- Leafy greens (like spinach, kale)
- Legumes (beans, lentils)
- Red meat or liver
- Fortified cereals

2. Omega-3 fatty acids
 Omega-3s have anti-inflammatory properties that can reduce menstrual cramps and support mood.
 Include:
- Fatty fish (salmon, sardines)
- Chia seeds and flaxseeds
- Walnuts

3. Hydration and fiber
 Staying hydrated helps reduce bloating and cramps. Fiber improves digestion and keeps you feeling light.
 Include:
- Water, herbal teas, coconut water
- Whole grains, fruits, and vegetables

Self-Care Tips for Your Period
Menstruation is a natural process, but it can come with physical and emotional challenges. Prioritizing self-care can make your cycle more manageable.
Helpful self-care tips:
- Rest – Don’t overwork yourself; allow your body time to recover.
- Heat therapy – Use a hot water bottle or heating pad to soothe cramps.
- Gentle movement – Light yoga or stretching can relieve tension.
- Mindfulness – Practice self-love and be kind to your body.
- Avoid excess sugar and caffeine – These can worsen bloating, irritability, and breast tenderness.
- Get enough sleep – Lack of sleep can affect your mood and energy levels.
- Stay active – Light exercise can help reduce cramping and improve mood.
- Practice good hygiene – Wash your hands and genital area regularly.
- Use tampons or menstrual cups – These are more hygienic than pads.
- Get enough sleep – Lack of sleep can affect your mood and energy levels.

Remember: Taking care of yourself during your period is not a luxury — it’s a necessity. Listen to your body, nourish it, and give it the rest and love it needs.
'''),
  HealthEducationTopicModel(
    coverImageUrl: 'assets/images/learn/myths_facts.jpg',
    title: "Myths and Facts About Menstruation",
    description: '''
    Common Myths and Facts About Menstruation
Myth 1: You can’t get pregnant during your period.
Fact: While it's less likely, pregnancy during menstruation is possible, especially for people with shorter or irregular cycles. Sperm can survive inside the reproductive system for up to 5 days, so if ovulation happens shortly after your period, fertilization can occur.

Myth 2: Period blood is dirty or impure.
Fact: Menstrual blood is not dirty. It's made up of blood, mucus, and tissue from the uterine lining — a natural and healthy part of the menstrual cycle. Menstruation is your body’s way of resetting when there's no pregnancy.

Myth 3: You should avoid bathing or washing your hair during your period.
Fact: There’s no scientific reason to avoid bathing or washing your hair while menstruating. In fact, warm baths can relieve cramps and improve hygiene. Staying clean during your period is part of healthy self-care.

Myth 4: Exercising during your period is harmful.
Fact: Exercise is actually beneficial during menstruation. It can help reduce cramps, improve mood, and increase energy. Light activities like walking, yoga, or stretching are especially helpful.

Myth 5: Using tampons or menstrual cups will “break” your virginity.
Fact: Virginity is a social concept, not a medical condition. Using a tampon or cup may stretch the hymen, but it doesn’t change a person’s virginity. These products are safe when used properly.

Myth 6: Everyone has a 28-day menstrual cycle.
Fact: While 28 days is the average, menstrual cycles can range from 21 to 35 days and still be normal. Every person’s body is different, and variations are common, especially in teens.

Myth 7: Periods should always be regular.
Fact: It can take months or years for menstrual cycles to become regular, especially in young people. Stress, diet, weight changes, and health conditions can also affect cycle regularity.

Myth 8: Menstruating people are “unclean” or should stay isolated.
Fact: This myth is rooted in harmful taboos. Menstruation is a natural biological process. No one should be excluded from school, worship, work, or family life because of their period.
''',
  )
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

final List<ForumBlogModel> forumBlogs = [
  ForumBlogModel(
    title: "Breaking the Stigma: Let's Talk About Periods",
    description:
        "I'm getting really tired of the hypocrisy around menstruation. Let's have an open discussion about breaking these barriers.",
    authorName: "Sarah Johnson",
    authorAvatar: "assets/images/default.jpg",
    datePosted: DateTime.now().subtract(Duration(days: 2)),
    likes: 225,
    comments: 66,
    content:
        '''Growing up, I noticed how menstruation was always discussed in hushed tones, if at all. This silence has created a barrier that affects millions of people worldwide, leading to misconceptions, shame, and inadequate support systems. Today, I want to address this head-on and discuss why we need to break these stigmas.

First, let's acknowledge the impact of period stigma. In many cultures, menstruating individuals are considered 'impure' or 'unclean.' This harmful belief has real consequences: students missing school, workers calling in sick but afraid to state the real reason, and people feeling embarrassed to buy menstrual products. The economic impact is significant too - many countries still tax menstrual products as 'luxury items,' making them inaccessible to those who need them most.

The media hasn't helped either. For decades, commercials have used blue liquid instead of red to demonstrate absorbency, perpetuating the idea that periods are something to hide. Even in health education, menstruation is often taught in gender-segregated classes, reinforcing the notion that it's something shameful or secret.

But here's why we need to change this narrative: Menstruation is a natural biological process that affects roughly half the world's population. It's not just a 'women's issue' - it's a human issue that impacts families, workplaces, and communities. When we stigmatize periods, we create barriers to health education, medical care, and basic dignity.

I've seen positive changes in recent years. More companies are offering menstrual leave, schools are providing free period products, and social media has enabled more open discussions. However, we still have a long way to go. We need comprehensive education that starts early and includes everyone. We need policies that recognize menstrual health as a basic right. Most importantly, we need to normalize these conversations.

Here's what we can do:
1. Speak openly about periods - use proper terms and correct misinformation
2. Support organizations working to end period poverty
3. Advocate for policy changes in schools and workplaces
4. Share experiences and create safe spaces for discussion
5. Challenge harmful jokes and stigmas when we encounter them

The cost of silence is too high. When we don't talk about periods, we allow myths and misconceptions to persist. This affects everything from personal relationships to healthcare access. Young people especially need to know that their bodies are normal and that they shouldn't feel ashamed.

Let's make this change together. Share your stories, support others who speak up, and help create a world where no one feels embarrassed about a natural bodily function. The more we talk about it, the more normal it becomes, and that's exactly what we need.''',
  ),
  ForumBlogModel(
    title: "My Journey with PCOS",
    description:
        "Sharing my personal experience with PCOS and how I learned to manage it effectively.",
    authorName: "Emily Chen",
    authorAvatar: "assets/images/default.jpg",
    datePosted: DateTime.now().subtract(Duration(days: 5)),
    likes: 189,
    comments: 45,
    content:
        '''When I was first diagnosed with PCOS (Polycystic Ovary Syndrome), I felt overwhelmed and alone. The doctor threw around terms like 'insulin resistance,' 'hormonal imbalance,' and 'irregular periods,' but I didn't fully understand what it all meant for my daily life. Now, after years of learning to manage this condition, I want to share my experience to help others navigating the same path.

PCOS affects about 1 in 10 women of reproductive age, yet it's still widely misunderstood. For me, the symptoms started gradually - irregular periods, unexplained weight gain, acne that wouldn't clear up no matter what I tried, and patches of darker skin. I dismissed these signs initially, attributing them to stress or poor diet. It wasn't until I went six months without a period that I finally sought medical help.

The diagnosis process was frustrating. I had to visit multiple doctors before finding one who took my symptoms seriously. Many dismissed my concerns or simply prescribed birth control without addressing the underlying issues. This is a common experience for many PCOS patients, and it highlights the need for better awareness among healthcare providers.

Living with PCOS has taught me the importance of being your own advocate. I've learned to research, ask questions, and push for comprehensive care. Here's what I've discovered works for me:

1. Lifestyle Changes:
   - Regular exercise, especially strength training and HIIT
   - Anti-inflammatory diet focusing on whole foods
   - Consistent sleep schedule
   - Stress management through meditation and yoga

2. Medical Management:
   - Working with an endocrinologist for hormone management
   - Regular monitoring of insulin levels
   - Supplements (inositol, vitamin D, magnesium)
   - Specific skincare routine for hormonal acne

3. Mental Health Support:
   - Joining PCOS support groups
   - Regular therapy sessions
   - Practicing self-compassion
   - Building a support network

One of the biggest challenges with PCOS is its impact on fertility. While not everyone with PCOS wants to have children, for those who do, it can be an additional source of stress. I've learned that early intervention and proper management can significantly improve fertility outcomes. Working with a reproductive endocrinologist has helped me understand my options and plan for the future.

The emotional impact of PCOS shouldn't be underestimated. The visible symptoms like acne, hair growth, and weight changes can affect self-esteem and body image. I've had days where I felt betrayed by my body, but I've learned to focus on what my body can do rather than how it looks. This shift in perspective has been crucial for my mental health.

Another aspect rarely discussed is the financial burden. Managing PCOS often requires multiple medications, supplements, regular doctor visits, and lifestyle modifications. I've had to budget carefully and advocate for insurance coverage. This economic aspect of chronic illness management is something we need to address more openly.

Through this journey, I've discovered the power of community. Connecting with others who have PCOS has provided validation, support, and practical tips. We share success stories, treatment experiences, and coping strategies. This sense of community has been invaluable in my healing process.

For anyone recently diagnosed with PCOS, know that while it's a challenging condition, it's manageable with the right support and resources. Don't be afraid to seek second opinions, ask questions, and make your health a priority. Remember that everyone's PCOS journey is different, and what works for one person may not work for another.

Looking ahead, I'm hopeful about the increasing research and awareness around PCOS. New treatments are being developed, and more healthcare providers are becoming knowledgeable about this condition. By sharing our stories and supporting each other, we can continue to advocate for better care and understanding of PCOS.''',
  ),
  ForumBlogModel(
    title: "Sustainable Period Products Guide",
    description:
        "A comprehensive guide to eco-friendly menstrual products and their benefits.",
    authorName: "Maya Patel",
    authorAvatar: "assets/images/default.jpg",
    datePosted: DateTime.now().subtract(Duration(days: 7)),
    likes: 156,
    comments: 38,
    content:
        '''Making the switch to sustainable period products is not just good for the environment - it's a transformative journey that can change your relationship with your body and our planet. After years of using conventional products, I decided to explore eco-friendly alternatives, and the experience has been eye-opening.

Let's start with some shocking statistics: The average menstruator uses approximately 11,000 disposable period products in their lifetime. These products take 500-800 years to decompose, contributing significantly to landfill waste. A single conventional pad contains the equivalent of four plastic bags, and tampons often contain synthetic materials that break down into harmful microplastics.

The Environmental Impact:
1. Waste Generation
   - Billions of period products end up in landfills annually
   - Most conventional products contain non-biodegradable materials
   - Packaging waste adds another layer of environmental burden
   - Ocean pollution from incorrectly disposed products

2. Carbon Footprint
   - Manufacturing processes contribute to greenhouse gas emissions
   - Transportation and distribution add to the environmental cost
   - Disposal methods often involve incineration or landfilling
   - Chemical processing of raw materials

Sustainable Alternatives:

1. Menstrual Cups
   - Made from medical-grade silicone
   - Can last up to 10 years with proper care
   - Available in different sizes and shapes
   - Cost-effective in the long run
   - Significantly reduces waste
   - Can be worn for up to 12 hours

2. Reusable Pads
   - Made from organic cotton or bamboo
   - Washable and reusable for 2-3 years
   - Various absorbency levels available
   - More comfortable than disposable options
   - Beautiful designs and patterns available
   - Chemical-free materials

3. Period Underwear
   - Built-in absorbent layers
   - Multiple styles for different flows
   - Can be used alone or as backup protection
   - Feels like wearing regular underwear
   - Easy to care for
   - Perfect for overnight protection

Making the Switch:

1. Start Gradually
   - Try one sustainable product at a time
   - Keep backup options available while learning
   - Give yourself time to adjust
   - Listen to your body's needs

2. Proper Care
   - Follow cleaning instructions carefully
   - Store products appropriately
   - Replace when recommended
   - Maintain good hygiene practices

3. Cost Considerations
   - Initial investment may seem high
   - Calculate long-term savings
   - Consider environmental benefits
   - Factor in convenience

The learning curve might seem steep at first, but the benefits far outweigh the initial challenges. Not only are you reducing your environmental impact, but you're also choosing healthier options for your body. Many users report fewer irritations, better awareness of their cycles, and a more positive period experience overall.

Remember, every small change counts. Whether you start with one reusable pad or dive straight into using a menstrual cup, you're contributing to a more sustainable future. Let's make conscious choices that benefit both our bodies and our planet.''',
  ),
  ForumBlogModel(
    title: "Exercise During Your Period",
    description:
        "Tips and tricks for staying active during menstruation without compromising comfort.",
    authorName: "Lisa Thompson",
    authorAvatar: "assets/images/default.jpg",
    datePosted: DateTime.now().subtract(Duration(days: 10)),
    likes: 201,
    comments: 52,
    content:
        '''Many people wonder if it's safe to exercise during their period, and as a fitness instructor, I'm here to tell you that not only is it safe, but it can actually help alleviate many common menstrual symptoms. However, it's important to understand how your body changes throughout your cycle to optimize your workouts and maintain comfort.

Understanding Your Cycle and Exercise:

1. Menstrual Phase (Days 1-5)
   - Energy levels may be lower
   - Focus on gentle movement
   - Listen to your body's needs
   - Stay hydrated
   - Consider lighter weights
   - Avoid inverted poses if uncomfortable

2. Follicular Phase (Days 6-14)
   - Rising energy levels
   - Good time for high-intensity workouts
   - Increased strength potential
   - Better endurance
   - Enhanced recovery
   - Try new challenges

3. Ovulation (Day 14-16)
   - Peak energy levels
   - Maximum strength potential
   - Great coordination
   - Perfect for challenging workouts
   - High motivation
   - Social activities

4. Luteal Phase (Days 17-28)
   - Gradually decreasing energy
   - Focus on maintenance
   - Listen to fatigue signals
   - Modify as needed
   - Gentle stretching
   - Stress management

Best Exercises During Your Period:

1. Low-Impact Cardio
   - Walking
   - Swimming
   - Cycling
   - Elliptical
   - Light jogging
   - Dance

2. Strength Training
   - Modified weight training
   - Body weight exercises
   - Resistance bands
   - Pilates
   - Barre workouts
   - Core strengthening

3. Flexibility Work
   - Gentle yoga
   - Stretching
   - Mobility exercises
   - Balance work
   - Breathing exercises
   - Meditation

Tips for Comfortable Exercise:

1. Proper Gear
   - Wear dark, comfortable clothing
   - Use appropriate menstrual products
   - Bring extra supplies
   - Layer your clothing
   - Supportive sports bra
   - Breathable fabrics

2. Timing
   - Exercise when energy is highest
   - Plan rest days around heavy days
   - Listen to your body
   - Adjust workout length
   - Schedule recovery time
   - Be flexible with routine

3. Hydration and Nutrition
   - Drink plenty of water
   - Eat iron-rich foods
   - Consider electrolyte replacement
   - Time meals appropriately
   - Monitor energy levels
   - Support recovery

Benefits of Exercise During Menstruation:

1. Physical Benefits
   - Reduced cramping
   - Better circulation
   - Improved mood
   - Enhanced energy
   - Better sleep
   - Reduced bloating

2. Mental Benefits
   - Stress relief
   - Emotional balance
   - Increased confidence
   - Better focus
   - Reduced anxiety
   - Positive mindset

Remember that every body is different, and what works for one person may not work for another. Pay attention to your body's signals and adjust your routine accordingly. Don't feel guilty about taking it easier during your period - it's all part of the natural cycle of your body.''',
  ),
  ForumBlogModel(
    title: "Understanding Endometriosis",
    description:
        "My personal journey with endometriosis and how I learned to manage it.",
    authorName: "Rachel Martinez",
    authorAvatar: "assets/images/default.jpg",
    datePosted: DateTime.now().subtract(Duration(days: 12)),
    likes: 245,
    comments: 71,
    content:
        '''Living with endometriosis can be challenging, but understanding the condition is the first step toward better management. After six years of struggling with unexplained pain and multiple misdiagnoses, I finally received my endometriosis diagnosis. Today, I want to share my journey and the knowledge I've gained to help others who might be facing similar challenges.

What is Endometriosis?
Endometriosis occurs when tissue similar to the uterine lining grows outside the uterus. This tissue can be found on:
- Ovaries
- Fallopian tubes
- Outer surface of the uterus
- Pelvic cavity
- Bowel
- Bladder
- Other organs in severe cases

Common Symptoms:
1. Pain
   - Severe menstrual cramps
   - Chronic pelvic pain
   - Pain during intercourse
   - Back pain
   - Digestive pain
   - Joint pain

2. Other Symptoms
   - Heavy menstrual bleeding
   - Irregular periods
   - Fatigue
   - Bloating
   - Digestive issues
   - Fertility challenges

My Diagnosis Journey:

Year 1-2:
- Dismissed as "normal period pain"
- Prescribed basic pain medication
- Told to exercise more
- Symptoms worsening
- Multiple ER visits
- Increasing anxiety

Year 3-4:
- Changed doctors three times
- Started tracking symptoms
- Tried various birth control options
- Depression setting in
- Career impacts
- Relationship strain

Year 5-6:
- Found specialist through support group
- Underwent proper examination
- Laparoscopic surgery scheduled
- Finally diagnosed
- Started treatment plan
- Found community support

Managing Endometriosis:

1. Medical Treatments
   - Hormonal therapy
   - Pain management
   - Anti-inflammatory medications
   - Regular check-ups
   - Physical therapy
   - Alternative treatments

2. Lifestyle Changes
   - Anti-inflammatory diet
   - Regular exercise
   - Stress management
   - Sleep hygiene
   - Trigger avoidance
   - Support system

3. Mental Health Support
   - Therapy sessions
   - Support groups
   - Mindfulness practices
   - Self-advocacy
   - Relationship counseling
   - Career planning

Impact on Daily Life:

1. Work Life
   - Flexible scheduling
   - Work from home options
   - Understanding employer
   - Modified duties
   - Sick day management
   - Career adjustments

2. Relationships
   - Open communication
   - Partner education
   - Family support
   - Friend understanding
   - Setting boundaries
   - Intimacy discussions

3. Self-Care
   - Pain management techniques
   - Energy conservation
   - Emotional support
   - Healthy boundaries
   - Regular rest
   - Stress reduction

Looking Forward:

1. Research and Treatment
   - New medical developments
   - Alternative therapies
   - Genetic studies
   - Better diagnostic tools
   - Earlier intervention
   - Improved treatments

2. Advocacy
   - Raising awareness
   - Supporting research
   - Sharing experiences
   - Educational initiatives
   - Policy changes
   - Community building

Remember that everyone's endometriosis journey is different. What works for one person may not work for another. The key is to:
- Find a healthcare team that listens
- Build a strong support system
- Educate yourself about the condition
- Advocate for your needs
- Take care of your mental health
- Stay hopeful for better treatments

Together, we can break the silence around endometriosis and create better understanding and support for those affected by this condition.''',
  ),
];
