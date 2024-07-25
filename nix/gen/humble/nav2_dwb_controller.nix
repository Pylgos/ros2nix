{
  ament_cmake,
  buildRosPackage,
  costmap_queue,
  dwb_core,
  dwb_critics,
  dwb_msgs,
  dwb_plugins,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_2d_msgs,
  nav_2d_utils,
  substituteSource,
}:
let
  sources = rec {
    nav2_dwb_controller = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "ef884f6402069b4bfca59b423a5953635bb2d02d";
        hash = "sha256-aRONz6KGdnRh3SE0zcwqnAhjtdGtHg9YPdQfOw/2j6U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_dwb_controller";
  version = "1.1.15-1";
  src = sources.nav2_dwb_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ costmap_queue dwb_core dwb_critics dwb_msgs dwb_plugins nav_2d_msgs nav_2d_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
