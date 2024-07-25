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
        rev = "2f65dd20d1c10ed6350cb139bcb75fe16eda7474";
        hash = "sha256-+5EBY5rFrsSUxvlRftwfW2n1mRawk08cpEXkCAQTmrk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport_msgs";
  version = "1.1.2-1";
  src = sources.ffmpeg_image_transport_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
