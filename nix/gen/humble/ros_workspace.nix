{
  ament_cmake_core,
  ament_package,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ros_workspace = substituteSource {
      src = fetchgit {
        name = "ros_workspace-source";
        url = "https://github.com/ros2-gbp/ros_workspace-release.git";
        rev = "8fd20fe34b5a5cbbf636bbdf3f62efcae053166d";
        hash = "sha256-FXiyjTZx5N94wlqTFY6bxysv+eiH6noKxFlYXOwcV2M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_workspace";
  version = "1.0.2-2";
  src = sources.ros_workspace;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_package ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
