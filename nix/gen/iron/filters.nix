{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    filters = substituteSource {
      src = fetchgit {
        name = "filters-source";
        url = "https://github.com/ros2-gbp/filters-release.git";
        rev = "8e29659900f45b92cb13238d11a0a639bfddaf79";
        hash = "sha256-Re52fPUttgC8YnZIBEC84USVr2a80IwbqJd14I2klNc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "filters";
  version = "2.1.0-5";
  src = sources.filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
