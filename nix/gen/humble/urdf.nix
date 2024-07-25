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
        rev = "491b263ce81ff79135003ffb74dbb88db80501b6";
        hash = "sha256-DxZFo62YkmnvyCroP3Uvy96UDa1SIvLux0t/YDchw6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf";
  version = "2.6.0-2";
  src = sources.urdf;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib tinyxml2_vendor urdf_parser_plugin urdfdom urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
