{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  leo_description,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_viz = substituteSource {
      src = fetchgit {
        name = "leo_viz-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "178c856c09c7e7c1e24c64c87823ce66c6fe2e76";
        hash = "sha256-2C7i0bQByR/kwoYKjelPz/+sMAaGyjgSeW0YtgMa8a8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_viz";
  version = "1.1.0-1";
  src = sources.leo_viz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui leo_description rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
