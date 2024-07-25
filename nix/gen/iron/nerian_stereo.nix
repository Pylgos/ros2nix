{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    nerian_stereo = substituteSource {
      src = fetchgit {
        name = "nerian_stereo-source";
        url = "https://github.com/nerian-vision/nerian_stereo_ros2-release.git";
        rev = "32d80ec578f073fbdd0ddbd4674de8453dcad7f3";
        hash = "sha256-7JABk+LZokHngEhswL2NRdfxGiF7Ll1BlBIxM8B7Zb8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nerian_stereo";
  version = "1.2.1-1";
  src = sources.nerian_stereo;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge rosidl_default_runtime sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
