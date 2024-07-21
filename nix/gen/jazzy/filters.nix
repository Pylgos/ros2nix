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
        rev = "4453644af7cf5338d89bb7df64174695674d45c8";
        hash = "sha256-hz/dFfNO4Dl2v0luZbIJQrfAimC4iBuF7HtT0XInGgk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "filters";
  version = "2.1.2-2";
  src = sources.filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}