const dashboardDisplayName = "Dasboard";
const dashboardRoute = "/dashboard";

const staffingDisplayName = "Pegawai";
const staffingRoute = "/dashboard/staffing";

const permissionDisplayName = "Ijin/Cuti";
const permissionRoute = "/dashboard/leave";

const salaryDisplayName = "Slip Gaji";
const salaryRoute = "/dashboard/salary";

const presenceDisplayName = "Absensi";
const presenceRoute = "/dashboard/presence";

const taskDisplayName = "Tugas";
const taskRoute = "/dashboard/tugas";

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
const authenticationDisplayName = "Setting";
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
];
