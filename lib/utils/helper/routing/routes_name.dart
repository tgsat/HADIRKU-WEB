const initialRoute = "/";

const dashboardDisplayName = "Dasboard";
const dashboardRoute = "/overview";

const staffingDisplayName = "Pegawai";
const staffingRoute = "/drivers";

const permissionDisplayName = "Ijin / Cuti";
const permissionRoute = "/leave";

const salaryDisplayName = "Slip Gaji";
const salaryRoute = "/salary";

const presenceDisplayName = "Absensi";
const presenceRoute = "/presence";

const taskDisplayName = "Tugas";
const taskRoute = "/tugas";

// Report
const reportDisplayName = "Laporan";
const reportRoute = "/laporan";
// Report-Presence
const reportPresenceDisplayName = "Laporan/Absensi";
const reportPresenceRoute = "/laporan/Absensi";
// Report-Salary
const reportSalaryDisplayName = "Laporan/Gaji";
const reportSalaryRoute = "/laporan/gaji";
// Report-Permission
const reportPermissionDisplayName = "Laporan/Ijin & Cuti";
const reportPermissionRoute = "/laporan/ijin-cuti";
// Report-Permission
const reportStaffingDisplayName = "Laporan/Kepegawaian";
const reportStaffingRoute = "/laporan/kepegawaian";
// Log Out
const authenticationDisplayName = "Logout";
const authenticationRoute = "/auth";
// Sig In
const authSignInDisplayName = "Masuk";
const authSignInRoute = "/auth/login";
// SignUp
const authSignUpDisplayName = "Daftar";
const authSignUpRoute = "/auth/register";
// Forget Password
const authForgetPasswordDisplayName = "Lupa Password";
const authForgetPasswordRoute = "/auth/forget-password";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(dashboardDisplayName, dashboardRoute),
  MenuItem(staffingDisplayName, staffingRoute),
  MenuItem(permissionDisplayName, permissionRoute),
  MenuItem(authenticationDisplayName, authenticationRoute),
];
