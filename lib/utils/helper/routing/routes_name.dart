const dashboardDisplayName = "Dasboard";
const dashboardRoute = "/dashboard";

const staffingDisplayName = "Pegawai";
const staffingRoute = "/pegawai";

const permissionDisplayName = "Ijin/Cuti";
const permissionRoute = "/cuti-ijin";

const salaryDisplayName = "Slip Gaji";
const salaryRoute = "/dashboard/salary";

const presenceDisplayName = "Absensi";
const presenceRoute = "/dashboard/presence";

const taskDisplayName = "Tugas";
const taskRoute = "/dashboard/tugas";

/// [Report]
const reportDisplayName = "Laporan";
const reportRoute = "/laporan";

/// [ReportPresence]
const reportPresenceDisplayName = "Laporan/Absensi";
const reportPresenceRoute = "/laporan/Absensi";

/// [ReportSalary]
const reportSalaryDisplayName = "Laporan/Gaji";
const reportSalaryRoute = "/laporan/gaji";

/// [ReportPermission]
const reportPermissionDisplayName = "Laporan/Ijin & Cuti";
const reportPermissionRoute = "/laporan/ijin-cuti";

/// [ReportPermission]
const reportStaffingDisplayName = "Laporan/Kepegawaian";
const reportStaffingRoute = "/laporan/kepegawaian";

/// [Profile]
const profileDisplayName = "Profile";
const profileRoute = "/profile";
const profileAccountRoute = "/profile/Account";
const profileChangePassRoute = "/profile/change-password";

/// [LogOut]
const authenticationDisplayName = "Setting";
const authenticationRoute = "/auth";

/// [ReAuth]
const reAuthRoute = "/re-auth";

/// [SigIn]
const authSignInDisplayName = "Masuk";
const authSignInRoute = "/auth/login";

/// [SignUp]
const authSignUpDisplayName = "Daftar";
const authSignUpRoute = "/auth/register";

/// [ForgetPassword]
const authForgetPasswordDisplayName = "Lupa Password";
const authForgetPasswordRoute = "/auth/forget-password";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMainMenuItemRoutes = [
  MenuItem(dashboardDisplayName, dashboardRoute),
  MenuItem(staffingDisplayName, staffingRoute),
  MenuItem(permissionDisplayName, permissionRoute),
];

List<MenuItem> sideMainMenuItemRoutes2 = [
  MenuItem(staffingDisplayName, staffingRoute),
  MenuItem(permissionDisplayName, permissionRoute),
];

List<MenuItem> sideAccountMenuItemRoutes = [
  MenuItem(authenticationDisplayName, authenticationRoute),
  MenuItem(profileDisplayName, profileRoute),
];
