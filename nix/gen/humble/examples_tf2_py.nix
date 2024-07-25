{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  python3Packages,
  substituteSource,
  tf2_ros_py,
}:
let
  sources = rec {
    examples_tf2_py = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "12cfd3371ba3689ebbec8a34396ba3f68801a35e";
        hash = "sha256-hvAWreKRtRiyTGkKqtRjpZ18ZXBZj3018SUyu0NiG3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_tf2_py";
  version = "0.25.7-1";
  src = sources.examples_tf2_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
