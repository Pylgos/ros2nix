{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_xml,
  launch_yaml,
  python3Packages,
  ros2cli,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2launch = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "289dc27ca38a1ce4d266c9e560652fb13889e406";
        hash = "sha256-K6MULkuMjj0ZZs3ELlPsU0V8bvOjdHqqjJE144OJlqI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch";
  version = "0.24.1-1";
  src = sources.ros2launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_xml launch_yaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
