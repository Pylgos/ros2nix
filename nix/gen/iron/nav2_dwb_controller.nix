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
        rev = "ad4d01fbcbbb517884c3dd0c828f06494e7f3d38";
        hash = "sha256-5b8l5aY2Az3yL+Tzrxs9Q4La7nyBaQLQhFEg2SH8phg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_dwb_controller";
  version = "1.2.9-1";
  src = sources.nav2_dwb_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ costmap_queue dwb_core dwb_critics dwb_msgs dwb_plugins nav_2d_msgs nav_2d_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
