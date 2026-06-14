import 'package:go_router/go_router.dart';
import 'package:trana/features/auth/presentation/screens/face_verify/face_verify_page.dart';
import 'package:trana/features/auth/presentation/screens/guardian_link/guardian_link_send_page.dart';
import 'package:trana/features/auth/presentation/screens/guardian_waiting/guardian_verify_waiting_page.dart';
import 'package:trana/features/auth/presentation/screens/id_card_camera/id_card_camera_page.dart';
import 'package:trana/features/auth/presentation/screens/id_card_confirm/id_card_confirm_page.dart';
import 'package:trana/features/auth/presentation/screens/intro/intro_page.dart';
import 'package:trana/features/auth/presentation/screens/select_age/select_user_age_page.dart';
import 'package:trana/features/auth/presentation/screens/social_login/social_login_page.dart';
import 'package:trana/features/auth/presentation/screens/splash/splash_page.dart';
import 'package:trana/features/auth/presentation/screens/terms/terms_agreement_page.dart';
import 'package:trana/features/contract/presentation/screens/biometric_lock/biometric_lock_page.dart';
import 'package:trana/features/contract/presentation/screens/create/create_contract_page.dart';
import 'package:trana/features/contract/presentation/screens/detail/contract_detail_page.dart';
import 'package:trana/features/contract/presentation/screens/modify/contract_modify_page.dart';
import 'package:trana/features/contract/presentation/screens/preview/contract_preview_page.dart';
import 'package:trana/features/contract/presentation/screens/request/contract_request_detail_page.dart';
import 'package:trana/features/contract/presentation/screens/request/modification_request_page.dart';
import 'package:trana/features/contract/presentation/screens/select_role/select_user_role_page.dart';
import 'package:trana/features/contract/presentation/screens/share/contract_share_page.dart';
import 'package:trana/features/contract/presentation/screens/template/contract_template_page.dart';
import 'package:trana/features/notification/presentation/screens/notification/notification_page.dart';
import 'package:trana/features/profile/presentation/screens/home/home_page.dart';

abstract class AppRoutes {
  // Auth
  static const splash = '/';
  static const intro = '/intro';
  static const selectAge = '/select-age';

  // Adult onboarding
  static const terms = '/terms';
  static const idCardCamera = '/id-card-camera';
  static const idCardConfirm = '/id-card-confirm';
  static const faceVerify = '/face-verify';

  // Minor onboarding
  static const socialLogin = '/social-login';
  static const guardianLink = '/guardian-link';
  static const guardianWaiting = '/guardian-waiting';

  // Home
  static const home = '/home';

  // Notification
  static const notification = '/notification';

  // Contract
  static const selectRole = '/select-role';
  static const contractTemplate = '/contract-template';
  static const contractCreate = '/contract/create';
  static const contractPreview = '/contract/preview';
  static const contractModify = '/contract/modify';
  static const contractShare = '/contract/share';
  static const contractDetail = '/contract/detail';
  static const biometricLock = '/biometric-lock';
  static const contractRequest = '/contract/request';
  static const modificationRequest = '/modification/request';
  static const modifySelectRole = '/modify/select-role';
  static const modifyContractCreate = '/modify/contract/create';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    // ── Auth ──────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.intro,
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      path: AppRoutes.selectAge,
      builder: (context, state) => const SelectUserAgePage(),
    ),

    // Adult onboarding
    GoRoute(
      path: AppRoutes.terms,
      builder: (context, state) => const TermsAgreementPage(),
    ),
    GoRoute(
      path: AppRoutes.idCardCamera,
      builder: (context, state) => const IdCardCameraPage(),
    ),
    GoRoute(
      path: AppRoutes.idCardConfirm,
      builder: (context, state) => const IdCardConfirmPage(),
    ),
    GoRoute(
      path: AppRoutes.faceVerify,
      builder: (context, state) => const FaceVerifyPage(),
    ),

    // Minor onboarding
    GoRoute(
      path: AppRoutes.socialLogin,
      builder: (context, state) => const SocialLoginPage(),
    ),
    GoRoute(
      path: AppRoutes.guardianLink,
      builder: (context, state) => const GuardianLinkSendPage(),
    ),
    GoRoute(
      path: AppRoutes.guardianWaiting,
      builder: (context, state) => const GuardianVerifyWaitingPage(),
    ),

    // ── Home ──────────────────────────────────────────────
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),

    // ── Notification ──────────────────────────────────────
    GoRoute(
      path: AppRoutes.notification,
      builder: (context, state) => const NotificationPage(),
    ),

    // ── Contract ──────────────────────────────────────────
    GoRoute(
      path: AppRoutes.selectRole,
      builder: (context, state) => const SelectUserRolePage(),
    ),
    GoRoute(
      path: AppRoutes.contractTemplate,
      builder: (context, state) => const ContractTemplatePage(),
    ),
    GoRoute(
      path: AppRoutes.contractCreate,
      builder: (context, state) => const CreateContractPage(),
    ),
    GoRoute(
      path: AppRoutes.contractPreview,
      builder: (context, state) => const ContractPreviewPage(),
    ),
    GoRoute(
      path: AppRoutes.contractModify,
      builder: (context, state) => const ContractModifyPage(),
    ),
    GoRoute(
      path: AppRoutes.contractShare,
      builder: (context, state) {
        final publicCode = state.extra as String;
        return ContractSharePage(publicCode: publicCode);
      },
    ),
    GoRoute(
      path: AppRoutes.contractDetail,
      builder: (context, state) => ContractDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.biometricLock,
      builder: (context, state) => const BiometricLockPage(),
    ),
    GoRoute(
      path: AppRoutes.contractRequest,
      builder: (context, state) => const ContractRequestDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.modificationRequest,
      builder: (context, state) => const ModificationRequestPage(),
    ),
    GoRoute(
      path: AppRoutes.modifySelectRole,
      builder: (context, state) => const SelectUserRolePage(isModify: true),
    ),
    GoRoute(
      path: AppRoutes.modifyContractCreate,
      builder: (context, state) => const CreateContractPage(isModify: true),
    ),
  ],
);
