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
        rev = "a797d7657e26d53f08814a728ef70844759b8842";
        hash = "sha256-wQ29hHJAn0G7oYS1sPqomyz/MYlPqvthqiK9e0hLN6o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turbojpeg_compressed_image_transport";
  version = "0.1.3-1";
  src = sources.turbojpeg_compressed_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libjpeg_turbo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
