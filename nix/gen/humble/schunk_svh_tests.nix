{
  buildRosPackage,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  schunk_svh_driver,
  substituteSource,
}:
let
  sources = rec {
    schunk_svh_tests = substituteSource {
      src = fetchgit {
        name = "schunk_svh_tests-source";
        url = "https://github.com/ros2-gbp/schunk_svh_ros_driver-release.git";
        rev = "28817e554b0c1280747b17c0d41037375cafcbe9";
        hash = "sha256-IT71FwEE4bMQ9QaC3uUSw09EhVClUM+lFg/6qbRXvtQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "schunk_svh_tests";
  version = "2.1.1-1";
  src = sources.schunk_svh_tests;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
