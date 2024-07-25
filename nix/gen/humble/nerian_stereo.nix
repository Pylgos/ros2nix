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
        rev = "c4bc6df97c388d2e0be18fe7da10f9ce7b5ba47d";
        hash = "sha256-7JABk+LZokHngEhswL2NRdfxGiF7Ll1BlBIxM8B7Zb8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nerian_stereo";
  version = "1.2.1-2";
  src = sources.nerian_stereo;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge rosidl_default_runtime sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
