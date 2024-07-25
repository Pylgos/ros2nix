{
  ament_cmake_google_benchmark,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  substituteSource,
  tinyxml2_vendor,
  urdf_parser_plugin,
  urdfdom,
  urdfdom_headers,
}:
let
  sources = rec {
    urdf = substituteSource {
      src = fetchgit {
        name = "urdf-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "b4fcafe9741beb0248a34aab8a05e704a2a41781";
        hash = "sha256-hMFHFArk1xQ96wUD819icDr+caHPWu/Az5u7EGn5LdY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf";
  version = "2.8.2-3";
  src = sources.urdf;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib tinyxml2_vendor urdf_parser_plugin urdfdom urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
