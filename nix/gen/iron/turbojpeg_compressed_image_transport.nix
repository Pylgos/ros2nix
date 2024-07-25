{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libjpeg_turbo,
  substituteSource,
}:
let
  sources = rec {
    turbojpeg_compressed_image_transport = substituteSource {
      src = fetchgit {
        name = "turbojpeg_compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/turbojpeg_compressed_image_transport-release.git";
        rev = "7d56c9ed5eca5802a7c67681b724d90e0aaad678";
        hash = "sha256-290O2WlZeS1IA0hOWZ0GYuYv0yt8SkAIxoz+P3YiVi8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turbojpeg_compressed_image_transport";
  version = "0.2.1-4";
  src = sources.turbojpeg_compressed_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libjpeg_turbo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
