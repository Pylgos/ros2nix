{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  microstrain_inertial_msgs,
  nav_msgs,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    microstrain_inertial_rqt = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_rqt-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "c419563e35d87e5746a46e5ac3adf4b1202fd0c4";
        hash = "sha256-SfEuY4PDqEWUD0/6/draATnUJY0mGH4OOeGYhdeYicA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_rqt";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_rqt;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs microstrain_inertial_msgs nav_msgs rclpy rqt_gui rqt_gui_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
