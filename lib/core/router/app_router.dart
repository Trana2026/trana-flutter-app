import 'package:go_router/go_router.dart';
import 'package:trana/core/network/auth_token_store.dart';
import 'package:trana/features/auth/presentation/screens/auth_complete/auth_complete_page.dart';
import 'package:trana/features/auth/presentation/screens/face_verify/face_verify_page.dart';
import 'package:trana/features/auth/presentation/screens/guardian_link/guardian_link_send_page.dart';
import 'package:trana/features/auth/presentation/screens/guardian_waiting/guardian_verify_waiting_page.dart';
import 'package:trana/features/auth/presentation/screens/id_card_camera/id_card_camera_page.dart';
import 'package:trana/features/auth/presentation/screens/id_card_confirm/id_card_confirm_page.dart';
import 'package:trana/features/auth/presentation/screens/intro/intro_page.dart';
import 'package:trana/features/auth/presentation/screens/pass_verify/pass_verify_page.dart';
import 'package:trana/features/auth/presentation/screens/select_age/select_user_age_page.dart';
import 'package:trana/features/auth/presentation/screens/social_login/social_login_page.dart';
import 'package:trana/features/auth/presentation/screens/splash/splash_page.dart';
import 'package:trana/features/auth/presentation/screens/terms/terms_agreement_page.dart';
import 'package:trana/features/contract/data/services/pending_contract_code_service.dart';
import 'package:trana/features/contract/data/services/pending_invitation_token_service.dart';
import 'package:trana/features/contract/presentation/screens/biometric_lock/biometric_lock_page.dart';
import 'package:trana/features/contract/presentation/screens/create/create_contract_page.dart';
import 'package:trana/features/contract/presentation/screens/detail/contract_detail_page.dart';
import 'package:trana/features/contract/presentation/screens/preview/contract_preview_page.dart';
import 'package:trana/features/contract/presentation/screens/request/contract_request_detail_page.dart';
import 'package:trana/features/contract/presentation/screens/request/sub_pages/contract_final_preview_page.dart';
import 'package:trana/features/contract/presentation/screens/request/sub_pages/contract_request_list_page.dart';
import 'package:trana/features/contract/presentation/screens/revision/revision_request_page.dart';
import 'package:trana/features/contract/presentation/screens/select_role/select_user_role_page.dart';
import 'package:trana/features/contract/presentation/screens/share/contract_share_page.dart';
import 'package:trana/features/contract/presentation/screens/detail/sub_pages/contract_entire_preview_page.dart';
import 'package:trana/features/contract/presentation/screens/template/contract_template_page.dart';
import 'package:trana/features/notification/presentation/screens/notification/notification_page.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';
import 'package:trana/features/profile/presentation/screens/home/home_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/customer_service_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/device_management_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/dispute_history_contract_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/edit_profile_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/inquiry_history_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/pending_contract_page.dart';
import 'package:trana/core/widgets/terms_detail_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/policy_list_page.dart';
import 'package:trana/features/profile/presentation/screens/my_page/sub_pages/total_contract_page.dart';

/// 앱 내 모든 라우트 경로 상수
abstract class AppRoutes {
  // Auth
  static const splash = '/';
  static const intro = '/intro';
  static const selectAge = '/select-age';

  // PASS onboarding (성인/미성년 통합)
  static const passVerify = '/pass-verify';

  // Adult onboarding
  static const terms = '/terms';
  static const idCardCamera = '/id-card-camera';
  static const idCardConfirm = '/id-card-confirm';
  static const faceVerify = '/face-verify';
  static const authComplete = '/auth-complete';

  // Minor onboarding
  static const socialLogin = '/social-login';
  static const guardianLink = '/guardian-link';
  static const guardianWaiting = '/guardian-waiting';

  // Home
  static const home = '/home';

  // Contract
  static const selectRole = '/contract/select-role';
  static const contractTemplate = '/contract/template';
  static const contractCreate = '/contract/create';
  static const contractPreview = '/contract/preview';
  static const contractShare = '/contract/share';
  static const contractDetail = '/contract/detail';
  static const biometricLock = '/contract/biometric-lock';
  static const requestDetail = '/contract/request-detail';
  static const requestList = '/contract/request-list';
  static const revisionRequest = '/contract/revision-request';
  static const finalPreview = '/contract/final-preview';
  static const entirePreview = '/contract/entire-preview';

  // MyPage
  static const totalContract = '/my/total-contract';
  static const pendingContract = '/my/pending-contract';
  static const disputeContract = '/my/dispute-contract';
  static const deviceManage = '/my/device-manage';
  static const notification = '/my/notification';
  static const customerService = '/my/customer-service';
  static const inquiryHistory = '/my/inquiry-history';
  static const policyList = '/my/policy-list';
  static const termsDetail = '/terms-detail';
  static const editProfile = '/my/edit-profile';
}

/// 앱 전체 라우팅 설정 (GoRouter)
/// 로그아웃 시 intro로 redirect할 보호 라우트 prefix
const _protectedPrefixes = ['/home', '/contract', '/my', '/guardian-waiting'];

/// 경로 단위 하나를 기준으로 보호 라우트 판정
/// (/contract는 /contract/*만 매칭, 딥링크 /contracts/*는 제외)
bool _isProtected(String loc) =>
    _protectedPrefixes.any((p) => loc == p || loc.startsWith('$p/'));

/// 앱 전체 라우팅 (GoRouter). [store] 변화에 반응. 세션 만료 시 보호화면에서 intro로 redirect
GoRouter createAppRouter(AuthTokenStore store) => GoRouter(
  initialLocation: AppRoutes.splash,
  refreshListenable: store,
  redirect: (context, state) {
    if (!store.isLoggedIn && _isProtected(state.matchedLocation)) {
      return AppRoutes.intro;
    }
    return null;
  },
  routes: [
    // ── Deep Link ─────────────────────────────────────────
    GoRoute(
      path: '/contracts/invitations/:token',
      redirect: (context, state) async {
        final token = state.pathParameters['token']!;
        // 초대 토큰 Shared 저장
        await PendingInvitationTokenService.save(token);
        // splash 페이지로 라우트
        return AppRoutes.splash;
      },
    ),
    GoRoute(
      path: '/contracts/:publicCode',
      redirect: (context, state) async {
        final publicCode = state.pathParameters['publicCode']!;
        // 계약코드 SharedPreference 저장 후 홈 진입 시 상세로 이동
        await PendingContractCodeService.save(publicCode);
        return AppRoutes.splash;
      },
    ),

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

    // PASS onboarding
    GoRoute(
      path: AppRoutes.passVerify,
      builder: (context, state) {
        final signupSessionId = state.extra as String;
        return PassVerifyPage(signupSessionId: signupSessionId);
      },
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
    GoRoute(
      path: AppRoutes.authComplete,
      builder: (context, state) => const AuthCompletePage(),
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
      path: AppRoutes.contractShare,
      builder: (context, state) {
        final publicCode = state.extra as String;
        return ContractSharePage(publicCode: publicCode);
      },
    ),
    GoRoute(
      path: AppRoutes.entirePreview,
      builder: (context, state) => ContractEntirePreviewPage(),
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
      path: AppRoutes.requestDetail,
      builder: (context, state) => const ContractRequestDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.requestList,
      builder: (context, state) => const ContractRequestListPage(),
    ),
    GoRoute(
      path: AppRoutes.revisionRequest,
      builder: (context, state) => const RevisionRequestPage(),
    ),
    GoRoute(
      path: AppRoutes.finalPreview,
      builder: (context, state) => const ContractFinalPreviewPage(),
    ),

    // ── MyPage ──────────────────────────────────────
    GoRoute(
      path: AppRoutes.totalContract,
      builder: (context, state) => const TotalContractPage(),
    ),
    GoRoute(
      path: AppRoutes.pendingContract,
      builder: (context, state) => const PendingContractPage(),
    ),
    GoRoute(
      path: AppRoutes.disputeContract,
      builder: (context, state) => const DisputeHistoryContractPage(),
    ),
    GoRoute(
      path: AppRoutes.deviceManage,
      builder: (context, state) => const DeviceManagementPage(),
    ),
    GoRoute(
      path: AppRoutes.notification,
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: AppRoutes.customerService,
      builder: (context, state) => const CustomerServicePage(),
    ),
    GoRoute(
      path: AppRoutes.inquiryHistory,
      builder: (context, state) => const InquiryHistoryPage(),
    ),
    GoRoute(
      path: AppRoutes.policyList,
      builder: (context, state) => const PolicyListPage(),
    ),
    GoRoute(
      path: AppRoutes.termsDetail,
      builder: (context, state) {
        // 약관 id(int) 또는 타입(TermsType)
        final extra = state.extra;
        return extra is TermsType
            ? TermsDetailPage.type(type: extra)
            : TermsDetailPage(termsId: extra as int);
      },
    ),
    GoRoute(
      path: AppRoutes.editProfile,
      builder: (context, state) => const EditProfilePage(),
    ),
  ],
);
