{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_description,
  leo_msgs,
  leo_teleop,
  substituteSource,
}:
let
  sources = rec {
    leo = substituteSource {
      src = fetchgit {
        name = "leo-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "b11a6f0839cd39f80c978cf1424ca45f25292e77";
        hash = "sha256-TMyXQtB6A9I4ZKiGv6Hjltf8gVadOxipGJN5JRBcg0Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo";
  version = "2.0.3-1";
  src = sources.leo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo_description leo_msgs leo_teleop ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
