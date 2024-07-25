{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_image_transport_msgs = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_msgs-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_msgs-release.git";
        rev = "136b3dedf6191b21ea703a86c4f1a709cb7ca334";
        hash = "sha256-jH2xq4iMPI7NZFEk/pWNmVEXqLgmII38pr34Q1nrSjA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport_msgs";
  version = "1.2.2-1";
  src = sources.ffmpeg_image_transport_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
