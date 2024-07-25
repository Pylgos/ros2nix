{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  nav_msgs,
  protobuf,
  python3,
  python3Packages,
  ros2launch,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  unzip,
  visualization_msgs,
  wget,
}:
let
  sources = rec {
    mvsim = substituteSource {
      src = fetchgit {
        name = "mvsim-source";
        url = "https://github.com/ros2-gbp/mvsim-release.git";
        rev = "a4a2b3080d581948a024a5b0204d6f4d206b2dd4";
        hash = "sha256-nVLQEho55D7tfOG4MwITL8EIA4Ly6UaCzOpm8BaZbzo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mvsim";
  version = "0.9.4-1";
  src = sources.mvsim;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment unzip wget ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint cppzmq mrpt2 nav_msgs protobuf python3 python3Packages.boost python3Packages.pip python3Packages.protobuf python3Packages.pybind11 ros2launch sensor_msgs tf2 tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
