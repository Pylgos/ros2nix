{
  ament_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  std_msgs,
  substituteSource,
  twist_mux_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    twist_mux = substituteSource {
      src = fetchgit {
        name = "twist_mux-source";
        url = "https://github.com/ros2-gbp/twist_mux-release.git";
        rev = "bd1e10b53352047bd364f36c2a569d8458040108";
        hash = "sha256-1U2LplwpCgA8qKz24xmFg4QH73v52isEVKL9Xck6OlA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "twist_mux";
  version = "4.3.0-1";
  src = sources.twist_mux;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater geometry_msgs rclcpp std_msgs twist_mux_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
