{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foros_msgs,
  ncurses,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    foros_inspector = substituteSource {
      src = fetchgit {
        name = "foros_inspector-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "a8f99a4dade3f6db666dd7b2627ba50f59a03d8e";
        hash = "sha256-WfePxLQcvtxpQxBIDPXuPTGMb87E/ySncvdid1KfFFk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foros_inspector";
  version = "0.4.1-2";
  src = sources.foros_inspector;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ foros_msgs ncurses rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
