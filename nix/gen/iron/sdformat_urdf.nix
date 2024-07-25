{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rcutils,
  sdformat_test_files,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdf_parser_plugin,
  urdfdom-headers,
}:
let
  sources = rec {
    sdformat_urdf = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "f0f4b19c56d6c9e903a375fc4620510fa357a19e";
        hash = "sha256-V16ZY8Qvi6qG7ex2Hw+OLTqOmYc60Xj6GkUitr8m/4I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_urdf";
  version = "1.0.1-3";
  src = sources.sdformat_urdf;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcutils tinyxml2_vendor urdf urdf_parser_plugin urdfdom-headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
